# /weekly-review

Execute the full weekly review workflow with memory compaction and self-improvement recommendations.

## When to Use

- Sunday or Monday planning sessions
- End of week reflection
- When [USER_NAME] says "run weekly review"

## INPUT

Read and gather:

1. **Memory Sources:**
   - `.claude/memory/session-scratch.md` (session observations)
   - `10_Command Center/[AGENT_NAME] Memory Bank.md` (existing memory)

2. **Weekly Activity:**
   - Past 7 days of daily notes from `70_Log/`
   - Past 7 days of `10_Command Center/[AGENT_NAME] Activity Log.md`

3. **Context Files:**
   - `10_Command Center/My Mission Document.md` (values and roles)
   - `10_Command Center/Vault Index.md` (active projects)
   - `00_INBOX/[AGENT_NAME] Tasks.md` (task queue status)
   - All Area COPs: `40_Areas/*/COP - *.md`
   - All Project COPs: `50_Projects/COP - *.md`

4. **Template:**
   - `80_Templates/Weekly Review Template.md`

## PROCESS

### Phase 1: Memory Compaction

1. Parse session scratch for observations (FRICTION, PATTERN, GAP, IDEA)
2. Scan daily notes for decisions, project updates, people context
3. Deduplicate against existing Memory Bank entries
4. Append new insights to the Memory Bank
5. Update `last_compacted` to today
6. Clear session scratch (preserve frontmatter and header)

### Phase 2: Self-Improvement Report

1. Review the Self-Improvement Log in the Memory Bank
2. Group and rank observations by frequency and impact
3. Present recommendations to [USER_NAME] as a short table: recommendation, evidence, effort
4. Create [AGENT_NAME] Tasks for approved items

### Phase 3: Weekly Reflection

1. Calculate task completion and habit completion rates from daily notes
2. Load all COP statuses and flag overdue reviews
3. Create the weekly review note from the template
4. Pre-populate the Scoreboard, COP Status, and What Happened sections
5. Leave the reflection sections for [USER_NAME]
6. Prune Recently Completed entries older than 30 days from `[AGENT_NAME] Tasks.md`

## OUTPUT

1. Updated Memory Bank
2. Cleared Session Scratch
3. New [AGENT_NAME] Tasks for approved recommendations
4. Weekly Review Note: `70_Log/YYYY-MM-DD - Weekly Review.md`

## Summary Format

```
**Weekly Review Complete**

📦 **Memory Compaction**
- [X] contextual insights captured
- Session scratch cleared

💡 **Recommendations**
- [X] presented, [Y] approved

📝 **Weekly Review Note**
- Created: [[YYYY-MM-DD - Weekly Review]]
- Task completion: [X]%
- Habit completion: [X]%

Ready for [USER_NAME] to complete the reflection sections.
```
