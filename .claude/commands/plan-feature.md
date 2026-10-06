---
description: "Research and write a spec for a feature or piece of work. Does NOT implement."
argument-hint: <what to plan>
---

# /plan-feature

Research, think, and write a spec. Do not build anything in this session. Building happens in a fresh session with `/execute`.

## Feature: $ARGUMENTS

## PROCESS

### 1. Understand the request
Restate the goal in one paragraph. If it is ambiguous, ask [USER_NAME] one or two sharp questions before continuing.

### 2. Research (isolate it)
Use sub-agents for exploration so this session's context stays clean. Gather:
- Relevant vault notes: the project's COP, prior specs, decisions, meeting notes
- If code is involved: read the project's `_README - Where Things Live.md` and explore the repo it points to
- Constraints from `My Mission Document.md` and the COP's Running Estimate

### 3. Decide the approach
List two or three approaches. Pick one. Say why in one line each for the rejected ones.

### 4. Write the spec
Use `80_Templates/Spec Template.md`. Save to:
- `50_Projects/{Project}/Spec - {Feature}.md` if it belongs to a project
- `00_INBOX/[AGENT_NAME] Task Outputs/Spec - {Feature} - {YYYY-MM-DD}.md` otherwise

Steps must be small enough that each can be verified on its own. Include a Verification section with concrete checks.

### 5. Log and stop
Log to the Activity Log. Add a task to `[AGENT_NAME] Tasks.md`: "Execute spec: [[Spec - {Feature}]]" with status `pending`. Then stop. Do not start building.

## OUTPUT

```
**Spec Written**

File: [[Spec - {Feature}]]
Steps: {N}
Open questions for [USER_NAME]: {N}

Review the spec, edit anything wrong, then in a fresh session run:
/execute 50_Projects/{Project}/Spec - {Feature}.md
```
