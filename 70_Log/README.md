# 70_Log

Time-based notes. Daily notes, weekly reviews, and anything else that is primarily "what happened on this date."

## Structure

```
70_Log/
  YYYY-MM-DD - Daily Note.md       <- created by /create-daily-note
  YYYY-MM-DD - Weekly Review.md    <- created by /weekly-review
```

Both are flat in this folder. Obsidian's search and the Calendar plugin handle navigation. If the folder gets large, the agent can move past years into `70_Log/YYYY/` during a weekly review.

## Daily notes

`/create-daily-note` builds today's note from `80_Templates/Daily Note Template.md`, adds today's habit tasks, and cancels any uncompleted habits from earlier days. The note has:

- **Top 3 Today:** the three tasks that matter. Fill these in yourself or ask the agent to propose them from your COPs.
- **Daily Habits:** auto-populated.
- **Notes & Captures:** anything from the day. Decisions, ideas, things people said.
- **Agent Summary:** the agent writes one paragraph at end of day on what it did.

## Weekly reviews

`/weekly-review` compacts the agent's session observations into the Memory Bank, presents improvement recommendations, and pre-fills a review note with COP status and task completion rates. You finish the reflection sections. Fifteen minutes on a Sunday keeps the agent and the vault honest.

## Why this folder matters to the agent

Daily notes are the agent's record of what actually happened, as opposed to what was planned. During weekly review it mines them for decisions, project updates, and people context. The more you capture in the daily note, the more the agent learns.
