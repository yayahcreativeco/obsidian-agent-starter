---
description: "Implement a pre-written spec in clean context"
argument-hint: <path to spec file>
---

# /execute

Implement a spec written by `/plan-feature`. This session builds; it does not re-plan.

## Spec: $ARGUMENTS

## PROCESS

1. **Read the spec** at the path given. If `$ARGUMENTS` is empty, list specs with `status: draft` or `status: approved` and ask which one.

2. **Check open questions.** If the spec's Open Questions section has unanswered items, ask [USER_NAME] now, before touching anything.

3. **Confirm the working location.** If the spec involves code, read the project's `_README - Where Things Live.md` and work in the repo path it names. Never write code into the vault.

4. **Work the steps in order.** After each step, run the step's verification before moving on. If a step fails twice, stop and report rather than improvising around the spec.

5. **Update the spec** as you go: mark steps done, note deviations and why.

6. **Finish:**
   - Run the full Verification section
   - Set the spec's `status` to `done`
   - Update the project COP: Situation Log entry, move tasks to Completed, add to Conclusions if something was learned
   - Update `[AGENT_NAME] Working Memory.md` for the project
   - Move the task in `[AGENT_NAME] Tasks.md` to Recently Completed with a link
   - Log to the Activity Log
   - If code changed, offer `/commit`

## OUTPUT

```
**Spec Executed**

Spec: [[Spec - {Feature}]]
Steps completed: {N}/{N}
Deviations: {list or none}
Verification: {pass/fail per check}

Files changed:
- ...
```
