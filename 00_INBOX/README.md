# 00_INBOX

The waiting room. Things land here fast and leave once you know where they belong.

## What lives here

| Item | Purpose |
|------|---------|
| `Inbox Tasks.md` | **Your** quick-capture task list. Type a task and move on. The agent reads it for awareness but does not execute from it. |
| `[AGENT_NAME] Tasks.md` | **The agent's** work queue. Structured tasks with priority and status. The agent works these at the start of every session. |
| `[AGENT_NAME] Task Inputs/` | Files you drop here for the agent to use: a PDF to summarize, a spec to build from, a spreadsheet to analyze. |
| `[AGENT_NAME] Task Outputs/` | Where the agent puts finished deliverables for your review: reports, HTML briefs, drafts. |
| Loose notes | Anything captured in a hurry. Triage weekly into the right folder. |

## How to delegate

1. Write the task in `Inbox Tasks.md` when it occurs to you.
2. When you are ready to hand it off, tell the agent "move the X task to your queue" or write it directly into `[AGENT_NAME] Tasks.md` using the task block format in that file.
3. Give enough detail that the agent can finish without asking: what done looks like, where the output goes, any constraints.
4. The agent moves it to In Progress, does the work, writes the output to `[AGENT_NAME] Task Outputs/`, and moves the task to Recently Completed with a link.

## Why this matters

The agent's queue is what makes it a coworker rather than a chatbot. If the queue is empty at session start, the agent waits for you. If it has three well-written tasks, the agent gets to work the moment you type `/prime`.
