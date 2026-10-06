---
type: reference
description: "How to work with your Claude Code agent so it gets better over time instead of worse"
tags: ["#review/monthly"]
---

# Agent Training Guide

You now have an AI coworker that reads and writes your vault. This guide is about how to work with it so that each week it knows you better. Read it once in your first week and again after a month.

---

## 1. The mental model

**Conversation is RAM. Files are disk.**

Everything you say in a session is gone when the session ends. The only things that survive are files. That is why `CLAUDE.md` makes the agent log activity, write decisions to disk immediately, and keep a Memory Bank. It is also why *you* should say "write that down" whenever something matters.

The agent is not magic. It is a very capable new hire who forgets everything overnight unless it took notes. Your job is to make sure the notes exist.

---

## 2. Your daily rhythm

A good day with your agent takes about ten minutes of overhead:

| When | What | Command or prompt |
|------|------|-------------------|
| Start | Load context | `/prime` |
| Start | Create today's note and habits | `/create-daily-note` |
| Start | Pick the three things that matter | "What should my top 3 be today based on my COPs and tasks?" |
| During | Delegate | "Add a task to your queue: ..." |
| During | Capture | "Capture this to inbox: ..." |
| End | Close out | "Summarize what we did today into the daily note and log it" |

Weekly: `/weekly-review` on Sunday or Monday. This is where the agent compacts what it noticed into long-term memory and you reflect against your mission.

---

## 3. Giving good instructions

**Say what done looks like.** "Research hosting options" is weak. "Compare three hosting options for a static site under $10/month and recommend one, two paragraphs, into 60_Resources" is strong.

**Point at files.** "Use the COP for the website project" beats describing the project again.

**Separate thinking from building.** Use `/plan-feature` to produce a spec, read the spec, fix it, then run `/execute` on it in a fresh session. Planning and building in one conversation produces worse results on both.

**Tell it when you change topics.** "Done with the website. Now let's look at the trip." The agent re-focuses.

**Correct it out loud.** "Too long, be shorter" or "You keep forgetting X" is exactly the feedback it logs to the Memory Bank. One correction saves you from repeating yourself forever.

---

## 4. Recognizing degraded context

Long sessions get worse. Signs:

- It repeats itself or forgets something you said 20 minutes ago
- It starts summarizing instead of doing
- Answers get vaguer

When you see this, run `/handoff`. It writes the session state to a file, and you start a fresh session with `/prime` and "continue from the handoff."

---

## 5. The WISC framework

| Letter | Strategy | What you do |
|--------|----------|-------------|
| **W** Write | Externalize memory | Ask for specs, decision notes, and enriched commits. "Write that decision to the COP." |
| **I** Isolate | Use sub-agents for research | "Spawn a sub-agent to research X and bring me a summary." Keeps the main conversation clean. |
| **S** Select | Load only what is needed | `/prime` loads the essentials. Do not paste whole folders into the chat. |
| **C** Compress | Reset when heavy | `/handoff`, then a fresh session. |

---

## 6. What to review monthly

- **Memory Bank:** Is anything wrong? Correct it in the file or tell the agent.
- **Vault Index:** Are the project statuses true?
- **COPs:** Does each Area and Project still have one, and is the Mission still right?
- **Skills and commands:** Did the agent suggest any during weekly reviews that you never approved? Decide.
- **This guide:** Anything you have learned that belongs here?

---

## 7. Growing your agent

The agent logs FRICTION, PATTERN, GAP, and IDEA observations during sessions. During `/weekly-review` it presents the recurring ones as recommendations: a new slash command, a new skill, a new template, an automation.

Approve the ones that would save you time weekly. Decline the rest. Each approved one becomes a task in `[AGENT_NAME] Tasks.md` and the agent builds it. That is how a generic starter kit becomes *your* agent over a few months.

---

## 8. Things it should never do without asking

Set in `CLAUDE.md` under Boundaries. The defaults:

- Edit an existing note it did not create
- Change the Mission, End State, or Decision Points in any COP
- Delete anything
- Send anything outside the vault (email, messages, posts)

Adjust to taste. Some people loosen these after a month. Some never do.
