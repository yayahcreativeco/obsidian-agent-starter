---
type: index
description: "Central index for Claude Code to quickly reference vault structure, areas, projects, and people"
last_updated: ""
---

# Vault Index

This index is a machine-readable reference so the agent understands the vault without scanning every file. Keep it current. The agent updates it when it creates Areas or Projects, but you should check it weekly.

> *How to fill this in: delete the example rows and add your own. An Area is an ongoing responsibility with no end date (Health, Career, Family, a business you run). A Project has a defined outcome and will end (Launch the website, Finish the certification, Plan the trip). If you are not sure, ask: "When is this done?" If the answer is "never," it is an Area.*

---

## Areas

| Area ID | Name | Folder Path | Primary Role | COP |
|---------|------|-------------|--------------|-----|
| example | Example Area | 40_Areas/Area - Example | [Role from Mission Document] | [[COP - Example]] |

---

## Active Projects

| Project | Area | Due | Status | Description | COP |
|---------|------|-----|--------|-------------|-----|
| Example Project | example | 2026-12-31 | active | One line on what it is and what done looks like | [[COP - Example Project]] |

**Status values:** `active` | `on-hold` | `completed` | `idea`

---

## People Registry

> *List the people the agent will hear you mention. The ID is a short lowercase handle. Context is one line: relationship and what the agent should know. Each person can get a full note in `60_Resources/People/Person - {Name}.md` when there is more to track.*

| ID | Name | Context |
|----|------|---------|
| example-person | Example Person | Relationship to you, role, and one relevant fact |

---

## Task Queues

| Queue | Owner | Purpose | Check Frequency |
|-------|-------|---------|-----------------|
| [[[AGENT_NAME] Tasks]] | [AGENT_NAME] | Structured tasks for autonomous execution | Session start |
| [[Inbox Tasks]] | [USER_NAME] | Quick capture human task inbox | Session start, for awareness |

**[AGENT_NAME]:** Always check [AGENT_NAME] Tasks at session start for pending work.

---

## Key Reference Files

| File | Purpose | Location |
|------|---------|----------|
| [[Vault SOPs]] | Complete system documentation and conventions | 10_Command Center/ |
| [[My Mission Document]] | Personal mission, values, roles, and context | 10_Command Center/ |
| [[Tag Strategy]] | Tag taxonomy and usage guidelines | 10_Command Center/ |
| [[Daily Habits]] | Recurring daily habit tracking | 10_Command Center/ |
| [[[AGENT_NAME] Memory Bank]] | [AGENT_NAME]'s persistent memory for context | 10_Command Center/ |
| [[[AGENT_NAME] Tasks]] | [AGENT_NAME]'s work queue | 00_INBOX/ |
| [[Agent Training Guide]] | How to work with your agent | 10_Command Center/ |

---

## Claude Code Commands

| Command | Purpose |
|---------|---------|
| `/prime` | Load full vault context and agent capabilities |
| `/create-daily-note [date]` | Generate daily note + daily habit tasks |
| `/weekly-review` | Full weekly review: memory compaction + reflection |
| `/memory-compact` | Standalone memory compaction |
| `/plan-feature <desc>` | Research and write a spec |
| `/execute <spec-path>` | Implement a spec in clean context |
| `/handoff` | Save session state for a fresh session |
| `/commit` | Enriched conventional commit |
| `/council <decision>` | Five-advisor decision pressure-test |
| `/command-create <desc>` | Create a new slash command |

---

## Folder Structure Quick Reference

```
00_INBOX          - Capture area for unsorted items and task queues
10_Command Center - Mission, SOPs, Memory Bank, this index
40_Areas          - Long-term stewardship domains
50_Projects       - Active projects with defined outcomes
60_Resources      - Knowledge library by topic, People notes
70_Log            - Daily notes, weekly reviews
80_Templates      - Note templates
90_Archive        - Completed or closed items
```

---

## Tag Categories (Frontmatter)

See [[Tag Strategy]] for the full taxonomy.

**Roles:** `#role/professional`, `#role/builder`, `#role/partner`, `#role/parent`, `#role/self`

**Content Types:** `#kind/resource_note`, `#kind/meeting`, `#kind/idea`, `#kind/quote`

**Review Frequency:** `#review/weekly`, `#review/monthly`, `#review/annual`

**Inline (Tasks Only):** `#top3`, `#10min`, `#status/*`

---

## Update Log

> *The agent appends a dated line here whenever it changes this index.*

- YYYY-MM-DD: Vault initialized from Mission Document
