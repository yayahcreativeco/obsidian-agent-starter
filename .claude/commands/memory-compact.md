# /memory-compact

Run memory compaction independently without the full weekly review workflow.

## When to Use

- Mid-week when session scratch is getting long
- Before a long break
- After intensive multi-day work sessions
- When [USER_NAME] says "compact memory" or "save observations"

## INPUT

1. **Session Scratch:** `.claude/memory/session-scratch.md`
2. **Memory Bank:** `10_Command Center/[AGENT_NAME] Memory Bank.md`
3. **Recent Daily Notes:** Past 3 to 7 days from `70_Log/` (optional)

## PROCESS

### 1. Parse Session Scratch

Extract observations by type:
- `FRICTION`: multi-step tasks that could be simpler
- `PATTERN`: repeated requests across sessions
- `GAP`: capability limitations or workarounds
- `IDEA`: new skill, command, or workflow suggestions

### 2. Extract Context from Daily Notes (Optional)

Scan for decisions, project status changes, people mentioned.

### 3. Deduplicate

Compare against the existing Memory Bank. Skip duplicates, update counts on repeats.

### 4. Update Memory Bank

Append to the appropriate sections. Update `last_compacted` to today.

### 5. Clear Session Scratch

Reset to the empty state, preserving frontmatter:

```markdown
---
type: session_scratch
description: "Real-time observations from agent sessions. Processed during weekly compaction."
---

# Session Scratch

> [AGENT_NAME] appends observations here during sessions. Processed weekly into the Memory Bank.

---

<!-- Observations below this line -->
```

## OUTPUT

```
**Memory Compaction Complete**

📦 **Processed:**
- [X] observations from session scratch
- [Y] contextual insights from daily notes

📝 **Added to Memory Bank:**
- Contextual: [categories updated]
- Self-Improvement: [X] friction points, [Y] ideas

Session scratch cleared.
```
