---
description: "Generate today's daily note and daily habit tasks"
---

# /create-daily-note

Generate a daily note from template and create daily habit tasks for the specified date.

## Target Date: $ARGUMENTS

If no date provided, use today's date.

## Context (INPUT)

**Daily Note Template:** `80_Templates/Daily Note Template.md`
**Daily Note Location:** `70_Log/`
**Daily Habits File:** `10_Command Center/Daily Habits.md`

**Naming Convention:** `YYYY-MM-DD - Daily Note.md`

## Process (PROCESS)

1. **Determine the target date**
   - If `$ARGUMENTS` contains a date (YYYY-MM-DD), use that date
   - If `$ARGUMENTS` is empty or "today", use today's date
   - If `$ARGUMENTS` is "tomorrow", use tomorrow's date

2. **Check if the daily note already exists**
   - Look for `70_Log/{date} - Daily Note.md`
   - If it exists, notify the user and ask whether to proceed

3. **Read the Daily Note Template**
   - Replace `{{date:YYYY-MM-DD}}` with the target date
   - Replace `{{date:dddd, MMMM D, YYYY}}` with the long-form date

4. **Create the Daily Note**
   - Write to `70_Log/{YYYY-MM-DD} - Daily Note.md`

5. **Cancel Uncompleted Past Habits**
   - Read the Today section of `10_Command Center/Daily Habits.md`
   - Find unchecked habits with a due date before the target date
   - Cancel by changing `- [ ]` to `- [-]` and appending ` ❌ {target-date}`

6. **Add Daily Habit Tasks (with duplicate check)**
   - Read the Habit List section of `Daily Habits.md`
   - If no habits already exist for the target date, insert one task per habit at the TOP of the Today section
   - Format: `- [ ] {habit name} 🔁 every day 📅 {YYYY-MM-DD}`
   - Also copy the same tasks into the Daily Habits section of the new daily note

7. **Verify** the habits were added and the note exists

8. **Log** to the Activity Log

## Output Format (OUTPUT)

```
**Daily Note Created**

Date: {YYYY-MM-DD}
File: `70_Log/{YYYY-MM-DD} - Daily Note.md`

**Past Habits Cancelled:** {N}
**Daily Habits Added:** {N}

Want me to propose your Top 3 from the COPs and task queues?
```
