# Sanitization Checklist

For the maintainer of this template. Use it every time you copy something from a live vault into this repo. The live vault is full of real names, paths, and client details. This repo must stay free of all of them, including this file.

## The rule

Nothing moves from a live vault into this repo by `git push`, `git merge`, or copying a folder wholesale. Only by hand, one file at a time, after a read and a grep.

## What to copy and what not to

| Safe to port after scrubbing | Never port |
|------------------------------|------------|
| Slash commands in `.claude/commands/` | `.claude/memory/` contents |
| Generic skills (Obsidian tooling, document conversion, research patterns) | Business-specific or client-specific skills |
| Templates in `80_Templates/` | Any file in `00_INBOX`, `40_Areas`, `50_Projects`, `60_Resources`, `70_Log`, `90_Archive` |
| Conventions and SOP changes | `.claude/settings.local.json`, `.claude/launch.json`, `.claude/plans/`, `.claude/worktrees/` |
| Scripts, after replacing hardcoded paths with script-relative paths | Hooks that reference absolute paths or local tooling |
| Structural improvements to `CLAUDE.md` | The Roles section or any example that names a real person, employer, or venture |

## Scrub steps for each file

1. Read the whole file. Not skim. Read.
2. Replace the owner's name with `[USER_NAME]` and the agent's name with `[AGENT_NAME]`. Lowercase forms become `[USER_NAME_LOWER]` and `[AGENT_NAME_LOWER]`.
3. Replace any `/Users/<name>/...` path with a relative path or `$CLAUDE_PROJECT_DIR`.
4. Replace real examples with fictional ones. Use "Jordan", "Sam Example", "Example Project".
5. Remove references to businesses, employers, clients, family members, schools, churches, towns, and ventures.
6. Remove any URL that points at a personal site, a client site, a Drive file, or a deployed app.
7. Remove email addresses, phone numbers, account identifiers, and anything that looks like a token.
8. Run the grep below.

## The grep

Generic patterns that catch most leaks regardless of whose vault they came from:

```bash
cd "$(git rev-parse --show-toplevel)" && grep -rnEi \
  --exclude-dir=.git \
  '/Users/|/home/|@[a-z0-9-]+\.(com|net|org|io|co)|[0-9]{3}-[0-9]{3}-[0-9]{4}|drive\.google\.com|docs\.google\.com|[A-Za-z0-9_-]{25,}|ghp_|sk-[a-zA-Z0-9]{10,}|vercel\.app|\.local\b' \
  . | grep -v 'SANITIZATION_CHECKLIST.md' | grep -vE 'raw\.githubusercontent|obsidian\.md|withaqua\.com|claude\.ai|jsoncanvas\.org|help\.obsidian\.md|github\.com/yayahcreativeco/obsidian-agent-starter'
```

Personal terms (your name, family names, employer, ventures, clients, agent names) live in a file **outside this repo** so the repo never contains the list itself. Create `~/.vault-template-terms` with one term per line, then:

```bash
cd "$(git rev-parse --show-toplevel)" && grep -rnFi --exclude-dir=.git -f ~/.vault-template-terms . | grep -v 'SANITIZATION_CHECKLIST.md' | grep -v 'github.com/yayahcreativeco/obsidian-agent-starter\|gh repo clone yayahcreativeco/obsidian-agent-starter'
```

Both greps must come back empty before you commit. The only allowed hit for the GitHub org name is the clone URL of this repo itself in `README.md` and `SETUP_GUIDE.md`.

## Placeholder consistency check

```bash
cd "$(git rev-parse --show-toplevel)" && grep -rnoE '\[(USER_NAME|AGENT_NAME|TIMEZONE)[A-Z_]*\]' --exclude-dir=.git . | sed 's/.*\[/[/' | sort | uniq -c
```

Only these five should appear: `[USER_NAME]`, `[USER_NAME_LOWER]`, `[AGENT_NAME]`, `[AGENT_NAME_LOWER]`, `[TIMEZONE]`. Anything else means a typo that `setup.sh` will miss.

## Test the setup script

Before pushing, do a dry run in a temp folder:

```bash
rm -rf /tmp/vault-test && git clone "$(git rev-parse --show-toplevel)" /tmp/vault-test && cd /tmp/vault-test && ./setup.sh
```

Answer the prompts with test values, then confirm no placeholders remain:

```bash
grep -rnE '\[(USER_NAME|AGENT_NAME|TIMEZONE)' --exclude-dir=.git /tmp/vault-test || echo "clean"
```

## When the live vault changes shape

If you add a folder, rename a Command Center file, or change a convention in the live vault, update all of these together here:

- `CLAUDE.md`
- `10_Command Center/Vault SOPs.md`
- `10_Command Center/Vault Index.md` (folder quick reference)
- The affected folder's `README.md`
- `.claude/commands/prime.md`
- `setup.sh` if a filename with `[AGENT_NAME]` was added
