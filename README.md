# Obsidian Agent Starter

A sanitized, ready-to-personalize Obsidian vault for running a Claude Code agent as a second brain. Clone it, run `setup.sh`, fill in three files, and the agent knows who it is, who you are, and how your vault works.

This repo is private. It is the source I pull from when I set up a new agent for someone. It contains no personal information from any existing vault. Every name, path, and example is either a placeholder or fictional.

---

## If you are setting someone up (quick path)

On their Mac, after Obsidian and Claude Code are installed (see `SETUP_GUIDE.md` steps 1 to 3):

```bash
cd ~/Documents
gh auth login
gh repo clone yayahcreativeco/obsidian-agent-starter "My Vault"
cd "My Vault"
./setup.sh
gh auth logout
```

`setup.sh` asks for their first name, the agent's name, and timezone, replaces every placeholder, renames the agent files, wipes the template's git history, and offers to create their own private repo. Then open the folder as a vault in Obsidian, run `claude`, and type `/prime`.

The `gh auth logout` at the end matters. You are logging in with your own GitHub account to reach this private repo. Log out so your credentials do not stay on their machine. If `gh` is not an option, download the repo as a ZIP from GitHub in your own browser and copy it over.

---

## If you are the person receiving this vault

Read `SETUP_GUIDE.md`. It walks through every install step. Then read `10_Command Center/Agent Training Guide.md` in your first week.

The three files that matter most, in order:

1. `CLAUDE.md`: your agent's job description. `setup.sh` fills the names. Read it once and edit anything that is not how you want your agent to behave.
2. `10_Command Center/My Mission Document.md`: who you are, what you are optimizing for, who matters to you. The agent reads this every session. Spend an hour on it.
3. `10_Command Center/Vault Index.md`: your Areas, Projects, and People. The agent's map.

Every folder has a `README.md` explaining what goes there and why the agent needs it.

---

## What is in the box

```
CLAUDE.md                  Agent identity, behavior rules, vault conventions, logging rules
SETUP_GUIDE.md             Step-by-step install (Obsidian, Claude Code, voice dictation, plugins)
SANITIZATION_CHECKLIST.md  For the template maintainer: how to pull improvements in without leaking
setup.sh                   Personalization script

00_INBOX/                  Two task queues (yours, the agent's) and agent input/output folders
10_Command Center/         Mission, Vault Index, SOPs, Tag Strategy, Daily Habits, Memory Bank,
                           Activity Log, Agent Training Guide
40_Areas/                  One folder + COP per ongoing responsibility (worked example included)
50_Projects/               One COP per project with an end (worked example included)
60_Resources/              Reference knowledge and People notes (worked example included)
70_Log/                    Daily notes and weekly reviews
80_Templates/              Daily note, weekly review, Area COP, Project COP, meeting, person, spec
90_Archive/                Finished things

.claude/commands/          /prime /create-daily-note /weekly-review /memory-compact
                           /plan-feature /execute /commit /handoff /council /command-create
.claude/skills/            cop-manager, obsidian-markdown, obsidian-bases, obsidian-cli,
                           json-canvas, defuddle
.claude/scripts/           micro-compact.py (nightly memory hygiene), vault-commit.sh (auto git)
.claude/memory/            session-scratch.md, MEMORY.md index
.claude/settings.json      Permissions and a Stop hook that logs session end
.obsidian/                 Core plugin toggles only. No workspace or device state.
```

## Design choices worth knowing

- **PARA folders with numeric prefixes** so they sort in workflow order and the agent can glob them.
- **COPs (Common Operating Pictures)** are the single status artifact per Area and Project. The agent reads them all at `/prime`. Owner-only sections keep the agent from rewriting your goals.
- **Two task queues.** Yours is quick capture. The agent's is structured. Delegation is moving a task from one to the other.
- **Memory is files, not conversation.** Activity Log, Session Scratch, Memory Bank, and per-project Working Memory. `CLAUDE.md` tells the agent to write immediately, not at session end.
- **Code never lives in the vault.** Each code-backed project has a `_README - Where Things Live.md` that points to the repo.
- **Placeholders** are `[USER_NAME]`, `[USER_NAME_LOWER]`, `[AGENT_NAME]`, `[AGENT_NAME_LOWER]`, `[TIMEZONE]`. They appear in file contents and in some filenames. `setup.sh` handles both.

## Maintaining this template

When the live vault grows a command, skill, or convention worth sharing, follow `SANITIZATION_CHECKLIST.md` before copying it here. The checklist has the grep that catches names, emails, home paths, and drive IDs. Never push from a live vault into this repo.

## Credits

The install flow in `SETUP_GUIDE.md` and the original vault shape came from a mentor's AI starter kit, since retired. The COP system, WISC context rules, two-queue task model, and most commands grew out of running this setup day to day across several agents.
