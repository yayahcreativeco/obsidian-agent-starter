#!/usr/bin/env python3
"""
MicroCompact: zero-API local context cleanup for the vault.

Runs nightly to reduce context bloat between full compaction cycles.
No Claude API calls — pure file operations.

Operations:
1. Archive session-scratch entries older than 7 days
2. Prune MEMORY.md — remove lines pointing to deleted files
3. Trim COP situation logs — keep only last N entries
4. Deduplicate identical session-scratch entries
5. Clean stale git worktrees (older than 3 days)
"""

import os
import re
import shutil
import subprocess
from datetime import datetime, timedelta
from pathlib import Path

VAULT_ROOT = Path(__file__).resolve().parents[2]  # vault root, resolved from this script
MEMORY_DIR = VAULT_ROOT / ".claude" / "memory"
SESSION_SCRATCH = MEMORY_DIR / "session-scratch.md"
MEMORY_INDEX = MEMORY_DIR / "MEMORY.md"
WORKTREE_DIR = VAULT_ROOT / ".claude" / "worktrees"
COP_DIRS = [VAULT_ROOT / "40_Areas", VAULT_ROOT / "50_Projects"]
LOG_FILE = VAULT_ROOT / ".claude" / "scripts" / "micro-compact.log"

MAX_SCRATCH_AGE_DAYS = 7
MAX_SITLOG_ENTRIES = 10
MAX_WORKTREE_AGE_DAYS = 3

TIMESTAMP_RE = re.compile(r"^\[(\d{4}-\d{2}-\d{2})\s+\d{2}:\d{2}\]")


def log(msg: str) -> None:
    ts = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    line = f"[{ts}] {msg}\n"
    print(line.strip())
    with open(LOG_FILE, "a") as f:
        f.write(line)


def archive_old_scratch_entries() -> int:
    """Remove session-scratch entries older than MAX_SCRATCH_AGE_DAYS."""
    if not SESSION_SCRATCH.exists():
        return 0

    lines = SESSION_SCRATCH.read_text().splitlines()
    cutoff = datetime.now() - timedelta(days=MAX_SCRATCH_AGE_DAYS)
    kept = []
    archived = 0
    in_frontmatter = False

    for line in lines:
        if line.strip() == "---":
            in_frontmatter = not in_frontmatter
            kept.append(line)
            continue
        if in_frontmatter:
            kept.append(line)
            continue

        match = TIMESTAMP_RE.match(line)
        if match:
            entry_date = datetime.strptime(match.group(1), "%Y-%m-%d")
            if entry_date < cutoff:
                archived += 1
                continue
        kept.append(line)

    if archived > 0:
        SESSION_SCRATCH.write_text("\n".join(kept) + "\n")
    return archived


def deduplicate_scratch() -> int:
    """Remove exact duplicate entries from session-scratch."""
    if not SESSION_SCRATCH.exists():
        return 0

    lines = SESSION_SCRATCH.read_text().splitlines()
    seen = set()
    deduped = []
    removed = 0
    in_frontmatter = False

    for line in lines:
        if line.strip() == "---":
            in_frontmatter = not in_frontmatter
            deduped.append(line)
            continue
        if in_frontmatter:
            deduped.append(line)
            continue

        stripped = line.strip()
        if TIMESTAMP_RE.match(stripped):
            # Normalize: strip timestamp for dedup comparison
            content = TIMESTAMP_RE.sub("", stripped).strip()
            if content in seen:
                removed += 1
                continue
            seen.add(content)
        deduped.append(line)

    if removed > 0:
        SESSION_SCRATCH.write_text("\n".join(deduped) + "\n")
    return removed


def prune_memory_index() -> int:
    """Remove MEMORY.md lines that point to deleted files."""
    if not MEMORY_INDEX.exists():
        return 0

    lines = MEMORY_INDEX.read_text().splitlines()
    pruned = []
    removed = 0
    link_re = re.compile(r"\[.*?\]\(([^)]+)\)")

    for line in lines:
        match = link_re.search(line)
        if match:
            target = match.group(1)
            target_path = (MEMORY_DIR / target).resolve()
            if not target_path.exists():
                removed += 1
                log(f"  Pruned dead link: {target}")
                continue
        pruned.append(line)

    if removed > 0:
        MEMORY_INDEX.write_text("\n".join(pruned) + "\n")
    return removed


def trim_cop_situation_logs() -> int:
    """Keep only last MAX_SITLOG_ENTRIES in each COP's Situation Log."""
    trimmed_total = 0

    for cop_root in COP_DIRS:
        if not cop_root.exists():
            continue
        for cop_file in cop_root.rglob("COP - *.md"):
            content = cop_file.read_text()

            # Find Situation Log section
            sitlog_start = content.find("## Situation Log")
            if sitlog_start == -1:
                continue

            # Find next section after Situation Log
            next_section = re.search(r"\n## ", content[sitlog_start + 1:])
            if next_section:
                sitlog_end = sitlog_start + 1 + next_section.start()
            else:
                sitlog_end = len(content)

            sitlog_section = content[sitlog_start:sitlog_end]
            entries = re.findall(r"(\n\| \d{4}-\d{2}-\d{2}[^\n]*)", sitlog_section)

            if len(entries) <= MAX_SITLOG_ENTRIES:
                continue

            # Keep header rows and last N entries
            excess = len(entries) - MAX_SITLOG_ENTRIES
            trimmed_total += excess

            # Rebuild: remove oldest entries (they appear first)
            for old_entry in entries[:excess]:
                sitlog_section = sitlog_section.replace(old_entry, "", 1)

            content = content[:sitlog_start] + sitlog_section + content[sitlog_end:]
            cop_file.write_text(content)
            log(f"  Trimmed {excess} old entries from {cop_file.name}")

    return trimmed_total


def clean_stale_worktrees() -> int:
    """Remove git worktrees older than MAX_WORKTREE_AGE_DAYS with no uncommitted changes."""
    if not WORKTREE_DIR.exists():
        return 0

    cleaned = 0
    cutoff = datetime.now() - timedelta(days=MAX_WORKTREE_AGE_DAYS)

    for wt in WORKTREE_DIR.iterdir():
        if not wt.is_dir():
            continue

        # Check age by directory mtime
        mtime = datetime.fromtimestamp(wt.stat().st_mtime)
        if mtime >= cutoff:
            continue

        # Check for uncommitted changes
        try:
            result = subprocess.run(
                ["git", "status", "--porcelain"],
                cwd=str(wt),
                capture_output=True,
                text=True,
                timeout=10,
            )
            if result.stdout.strip():
                log(f"  Skipped worktree {wt.name} (has uncommitted changes)")
                continue
        except (subprocess.TimeoutExpired, subprocess.CalledProcessError):
            log(f"  Skipped worktree {wt.name} (git status failed)")
            continue

        # Remove the worktree via git
        try:
            subprocess.run(
                ["git", "worktree", "remove", "--force", str(wt)],
                cwd=str(VAULT_ROOT),
                capture_output=True,
                text=True,
                timeout=30,
            )
            cleaned += 1
            log(f"  Removed stale worktree: {wt.name}")
        except (subprocess.TimeoutExpired, subprocess.CalledProcessError) as e:
            log(f"  Failed to remove worktree {wt.name}: {e}")

    return cleaned


def main() -> None:
    log("=== MicroCompact started ===")

    archived = archive_old_scratch_entries()
    log(f"Session scratch: archived {archived} old entries")

    deduped = deduplicate_scratch()
    log(f"Session scratch: removed {deduped} duplicates")

    pruned = prune_memory_index()
    log(f"MEMORY.md: pruned {pruned} dead links")

    trimmed = trim_cop_situation_logs()
    log(f"COP situation logs: trimmed {trimmed} old entries")

    cleaned = clean_stale_worktrees()
    log(f"Worktrees: cleaned {cleaned} stale worktrees")

    total = archived + deduped + pruned + trimmed + cleaned
    log(f"=== MicroCompact complete: {total} total items cleaned ===")


if __name__ == "__main__":
    main()
