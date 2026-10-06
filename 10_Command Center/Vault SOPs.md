---
type: reference
description: "Standard operating procedures for this vault: folder rules, naming, frontmatter, task syntax, and agent workflows"
last_updated: ""
---

# Vault SOPs

The operating rules for this vault. Both [USER_NAME] and [AGENT_NAME] follow these. When a rule here conflicts with a habit, the rule wins; if the rule is wrong, change the rule.

---

## 1. Folder Rules (PARA)

| Folder | Put here | Never put here |
|--------|----------|----------------|
| `00_INBOX` | Anything captured in a hurry, the two task queues, agent task inputs and outputs | Anything you have already decided where it belongs |
| `10_Command Center` | Mission, index, SOPs, memory, habits, dashboards | Project-specific notes |
| `40_Areas` | One folder per ongoing responsibility, each with a COP | Things that will be finished |
| `50_Projects` | One folder per project with a defined end, each with a COP | Reference material that outlives the project (move to Resources) |
| `60_Resources` | Topic knowledge, People notes, reusable prompts, reference guides | Tasks or decisions |
| `70_Log` | Daily notes, weekly reviews, journal entries | Anything you need to find by topic later (link it from a Resource instead) |
| `80_Templates` | Templates only | Real notes |
| `90_Archive` | Completed projects, closed areas, retired notes | Active anything |

**Inbox zero rule:** `00_INBOX` is a waiting room, not a home. Triage it at least weekly.

---

## 2. Naming

| Type | Pattern | Example |
|------|---------|---------|
| Area folder | `Area - {Name}` | `Area - Health` |
| Area COP | `COP - {Name}.md` | `COP - Health.md` |
| Project COP | `COP - {Name}.md` | `COP - Website Launch.md` |
| Daily note | `YYYY-MM-DD - Daily Note.md` | `2026-03-01 - Daily Note.md` |
| Weekly review | `YYYY-MM-DD - Weekly Review.md` | `2026-03-07 - Weekly Review.md` |
| Meeting | `Meeting - YYYY-MM-DD - {Title}.md` | `Meeting - 2026-03-01 - Kickoff.md` |
| Person | `Person - {Full Name}.md` | `Person - Jane Doe.md` |
| Group of people | `Group - {Name}.md` | `Group - Book Club.md` |
| Agent output | `{Type} - {slug} - YYYY-MM-DD.{ext}` | `Council - hire-contractor - 2026-03-01.html` |

Use spaces, not underscores or hyphens, inside names. Hyphens separate the parts of a name.

---

## 3. Frontmatter

Every note starts with YAML frontmatter. Minimum fields:

```yaml
---
type: resource_note        # see Tag Strategy for the list of types
description: "One line on what this note is"
tags: ["#kind/resource_note"]
---
```

Rules:
- Quote dates: `date: "2026-03-01"`
- Quote tags: `tags: ["#role/professional"]`
- When [AGENT_NAME] creates a note, add `_ai.created_by: "[AGENT_NAME_LOWER]"`
- Do not invent new frontmatter fields without adding them to this document

---

## 4. Tasks

This vault uses the **Obsidian Tasks** plugin syntax everywhere.

```markdown
- [ ] Action description #top3 📅 2026-02-05
- [x] Completed task ✅ 2026-02-03
- [-] Cancelled task ❌ 2026-02-03
- [ ] Recurring habit 🔁 every day 📅 2026-02-04
```

- Due date emoji is 📅, completion is ✅, cancelled is ❌, recurring is 🔁. Use the exact Unicode characters.
- Tasks start with a verb.
- Tag `#top3` marks today's three most important tasks.
- Tag `#10min` marks tasks that can be done in a gap.

### Two queues

- **`Inbox Tasks.md`** belongs to [USER_NAME]. Quick capture. The agent reads it for awareness but does not execute from it.
- **`[AGENT_NAME] Tasks.md`** belongs to [AGENT_NAME]. Structured tasks with Added, Priority, and Status fields. The agent works these in priority order at session start.

To delegate: move a task from Inbox Tasks to [AGENT_NAME] Tasks and give it enough detail that the agent can finish without asking you.

---

## 5. COPs (Common Operating Pictures)

Every Area and every Project has exactly one COP. The COP is where the agent and you agree on the current state of things.

- Create from `80_Templates/COP - Area.md` or `80_Templates/COP - Project.md`.
- The agent may directly edit: Conclusions & Recommendations, Situation Log, Tasks, RFIs, Key Metrics, Rhythms & Habits, Key People, Resources & Links.
- The agent must propose (not edit) changes to: Mission, End State, Critical Tasks, Running Estimate, Decision Points, Dependencies. Those are yours.
- The Situation Log is append-only, newest entry at the top, dated.
- Review cycle is set in frontmatter (`weekly`, `biweekly`, `monthly`). `/prime` flags COPs whose review is overdue.

---

## 6. Agent Memory

| File | Purpose | Cadence |
|------|---------|---------|
| `.claude/memory/session-scratch.md` | Raw observations during a session | Written constantly, compacted weekly |
| `10_Command Center/[AGENT_NAME] Memory Bank.md` | Long-term memory | Updated on trigger, compacted weekly |
| `10_Command Center/[AGENT_NAME] Activity Log.md` | What happened, when | Appended after every significant action |
| `50_Projects/{Project}/[AGENT_NAME] Working Memory.md` | Per-project state | Updated after meaningful project sessions |

If something is worth remembering, it goes in a file the same session. Nothing is remembered by default.

---

## 7. Code vs Notes

Code never lives in the vault. Each code-backed project has a `_README - Where Things Live.md` in its project folder mapping where the vault notes are and where the code, repo, deploy, and database are.

---

## 8. Git

The vault is a private Git repository. `.claude/scripts/vault-commit.sh` commits and pushes everything. Run it on a schedule or by hand. Secrets never go in the vault: `.gitignore` already excludes `.env` files, but do not rely on that alone.

---

## 9. Changing These SOPs

Edit this file directly. Tell the agent what changed so it updates the Memory Bank. Keep the `last_updated` field current.
