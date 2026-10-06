---
description: "Capture session state to disk so a fresh session can continue without loss"
---

# /handoff

Write the current session's state to a file and advise starting a fresh session. Use when context feels heavy, before a long break, or when switching topics.

## PROCESS

1. **Summarize the session** in these sections:
   - **Goal:** what we set out to do this session
   - **Done:** what was completed, with file paths
   - **In progress:** what is half-finished and exactly where it stopped
   - **Decisions:** anything decided, with the reason
   - **Open questions:** anything waiting on [USER_NAME]
   - **Next actions:** the first three things the next session should do
   - **Files touched:** list

2. **Write it** to `.claude/memory/handoff-{topic-slug}-{YYYY-MM-DD}.md`

3. **Update project working memory** if the session was about a specific project: `50_Projects/{Project}/[AGENT_NAME] Working Memory.md`

4. **Log** to the Activity Log: `handoff written for {topic}`

5. **Append any uncaptured observations** (FRICTION, PATTERN, GAP, IDEA) to session scratch

## OUTPUT

```
**Handoff Written**

File: `.claude/memory/handoff-{slug}-{date}.md`

Start a fresh session, run /prime, then say:
"Continue from the {topic} handoff."
```
