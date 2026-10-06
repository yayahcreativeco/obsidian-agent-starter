# 10_Command Center

This folder is the agent's brain stem. Everything here gets loaded at the start of every session by `/prime`, so what you write here shapes every single interaction.

## What lives here

| File | What it is | Who writes it |
|------|-----------|---------------|
| `My Mission Document.md` | Your mission, values, roles, constraints, biography, people. The agent's north star. | You. The agent reads it, never edits it. |
| `Vault Index.md` | Machine-readable map of your Areas, Projects, People, and task queues. | You start it. The agent keeps it current. |
| `Vault SOPs.md` | The operating rules of the vault: naming, frontmatter, where things go. | Shipped with sensible defaults. Edit as you learn. |
| `Tag Strategy.md` | Your tag taxonomy. Keeps tags consistent so queries work. | Shipped with defaults. Extend as needed. |
| `Daily Habits.md` | Recurring habit tasks. `/create-daily-note` adds a fresh set each day. | You list the habits once. The agent maintains. |
| `[AGENT_NAME] Memory Bank.md` | The agent's persistent memory across sessions: your preferences, project context, people context, decisions, recurring patterns. | The agent. You read it to see what it has learned. |
| `[AGENT_NAME] Activity Log.md` | Append-only log of what the agent did and when. | The agent. |
| `Agent Training Guide.md` | How to work with your agent well. Read it in your first week. | Shipped. |

## Why this folder matters more than any other

An AI agent with no context is a very smart stranger. Every file here turns the stranger into a coworker who knows your situation. The two files that do the most work:

1. **My Mission Document.** When you ask "should I take on this project?", the agent can only give you a useful answer if it knows what you are optimizing for. Spend an hour on this file. It pays back every week.
2. **The Memory Bank.** This is how the agent remembers that you prefer short answers, that Project X is on hold, that your sister's name is spelled a certain way. It only stays useful if the agent updates it, which is why `CLAUDE.md` tells it to update immediately rather than at session end.

## First-week checklist

- [ ] Fill in `My Mission Document.md` (at least Mission, Roles, Values, Current Focus, Constraints)
- [ ] Fill in the Areas and Projects tables in `Vault Index.md`
- [ ] Add the people you mention most to the People Registry in `Vault Index.md`
- [ ] List your real daily habits in `Daily Habits.md`
- [ ] Run `/prime` and confirm the agent summarizes your situation correctly
