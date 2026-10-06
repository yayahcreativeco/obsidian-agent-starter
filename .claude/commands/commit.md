---
description: "Create an enriched conventional commit that doubles as long-term memory"
---

# /commit

Commit the current changes with a message rich enough that a future session can understand what happened and why without reading the diff.

## PROCESS

1. **Check where you are.** Run `git status` and `git rev-parse --show-toplevel`. If the repo is the vault, that is fine. If the spec said to work in a code repo, make sure you are there.

2. **Review the diff.** `git diff` and `git diff --cached`. Group the changes into one logical commit; if there are two unrelated changes, make two commits.

3. **Never commit secrets.** If the diff contains anything that looks like a key, token, password, or `.env` content, stop and tell [USER_NAME].

4. **Write the message** in this shape:

```
<type>(<scope>): <imperative summary under 70 chars>

Why:
<one to three sentences on the reason for the change>

What:
- <bullet per meaningful change>

Refs: [[Spec - Name]] or [[COP - Name]] if applicable
```

Types: `feat`, `fix`, `docs`, `refactor`, `chore`, `vault` (for note changes).

5. **Commit.** Stage the relevant files and commit. Do not push unless [USER_NAME] asked.

6. **Log** to the Activity Log: `commit <short-hash>: <summary>`

## OUTPUT

```
**Committed**

<short-hash> <type>(<scope>): <summary>
Files: {N}
Pushed: no (say "push" if you want it pushed)
```
