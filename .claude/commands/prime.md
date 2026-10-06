# /prime

Load full vault context and [AGENT_NAME] capabilities for a productive session.

## When to Use

- At the start of every new session
- After context compaction or long conversations
- Before complex tasks requiring full vault awareness

## Actions

### 1. Load Vault Structure

Read and internalize these files:

| File | Purpose |
|------|---------|
| `10_Command Center/Vault Index.md` | Areas, projects, people registry |
| `10_Command Center/My Mission Document.md` | [USER_NAME]'s values, roles, life context |
| `10_Command Center/Vault SOPs.md` | System conventions and workflows |
| `10_Command Center/Tag Strategy.md` | Tag taxonomy and usage |
| `10_Command Center/[AGENT_NAME] Memory Bank.md` | Persistent memory and context |

Read the last ~40 lines of `10_Command Center/[AGENT_NAME] Activity Log.md` to re-establish what happened in prior sessions.

### 2. Load COPs (Common Operating Pictures)

Glob `40_Areas/*/COP - *.md` and `50_Projects/COP - *.md`. For each COP:
- Extract YAML frontmatter: domain, status, priority, due, review_cycle, last_updated
- Read the `## Conclusions & Recommendations` section
- Count open RFIs
- Find the next Decision Point

**Flag alerts:**
- Overdue reviews (last_updated older than the review_cycle)
- Red or amber status COPs
- Decision Points within 7 days

### 3. Load Session Scratch

Read `.claude/memory/session-scratch.md`:
- Note the count of uncompacted observations
- Flag if compaction is overdue (more than 7 days)

### 4. Check Task Queues

- **[USER_NAME]'s Task Queue:** Read `00_INBOX/Inbox Tasks.md`
- **[AGENT_NAME]'s Task Queue:** Read `00_INBOX/[AGENT_NAME] Tasks.md`
- **Inbox Items:** Scan `00_INBOX/` for unsorted items

### 5. Inventory [AGENT_NAME] Capabilities

Scan `.claude/skills/*/SKILL.md` and `.claude/commands/*.md`.

### 6. Memory Bank Staleness Check

After loading the Memory Bank, check `last_compacted` in its frontmatter. If it is more than 7 days old (or empty), run a mini memory sync:
- Compare projects in `Vault Index.md` against Project Context in the Memory Bank. Add missing projects, update status changes.
- Compare the People Registry against People Context. Add missing people.
- Update `last_compacted` to today.
- Note "Memory Bank synced" in the report.

### 7. Placeholder Check (first sessions only)

If any of the Command Center files still contain `[USER_NAME]`, `[AGENT_NAME]`, or italic setup prompts, tell [USER_NAME] which files still need filling in. Offer to walk through them one at a time.

### 8. Report Status

```
**Session Primed**

📁 **Vault Context**
- Areas: [count] active
- Projects: [count] active ([high priority count] high priority)
- People: [count] in registry

📊 **COP Status**
[Area and Project status summary, alerts first]

📋 **[USER_NAME]'s Tasks** (Inbox Tasks.md)
- [X] open tasks
- Due soon: [list any with near due dates]

🤖 **[AGENT_NAME]'s Tasks** ([AGENT_NAME] Tasks.md)
- [X] pending ([Y] high priority)
- Top task: [name] ([priority])

📥 **Inbox Items** (unsorted)
- [X] items awaiting triage

🔧 **[AGENT_NAME] Capabilities**
- Skills: [list names]
- Commands: [list names]

Ready for instructions, or I can start on [top task].
```
