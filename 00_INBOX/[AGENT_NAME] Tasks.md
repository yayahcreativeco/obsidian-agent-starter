---
type: task_queue
description: "[AGENT_NAME]'s structured work queue for autonomous execution"
owner: [AGENT_NAME_LOWER]
---

# [AGENT_NAME] Tasks

> Executed interactively during Claude Code sessions. Work pending tasks in priority order unless [USER_NAME] directs otherwise.
> Output files land in `00_INBOX/[AGENT_NAME] Task Outputs/` for [USER_NAME]'s review.

## Task block format

```
---
**Task:** Short imperative title
**Added:** YYYY-MM-DD
**Priority:** high | medium | low
**Status:** pending | in_progress | blocked | completed

What done looks like, where the output goes, constraints, and links to any inputs in [[AGENT_NAME] Task Inputs]] or elsewhere in the vault.
```

---

## Pending Tasks

---
**Task:** Example: Summarize the Mission Document back to [USER_NAME]
**Added:** YYYY-MM-DD
**Priority:** low
**Status:** pending

Read `10_Command Center/My Mission Document.md` and write a one-page "here is what I understand about you" summary to `00_INBOX/[AGENT_NAME] Task Outputs/Mission Summary - YYYY-MM-DD.md`. Flag any section that is still a placeholder. Delete this example task once real tasks exist.

---

## In Progress

---

## Recently Completed

<!-- Move finished tasks here with a wikilink to the output. Prune entries older than 30 days during /weekly-review. -->
