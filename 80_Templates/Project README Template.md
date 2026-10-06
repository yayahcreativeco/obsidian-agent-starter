---
type: reference
description: "Map of where {{title}}'s notes live (vault) and where its code lives (outside the vault)"
---

# {{title}}: Where Things Live

## Vault side (ideas, decisions, status)

| What | Where |
|------|-------|
| COP | [[COP - {{title}}]] |
| Working memory | [[[AGENT_NAME] Working Memory]] |
| Specs | `50_Projects/{{title}}/Spec - *.md` |
| Meeting notes | `50_Projects/{{title}}/Meeting - *.md` |

## Code side (writing and running the app)

| What | Where |
|------|-------|
| Local path | |
| GitHub | |
| Hosting | |
| Live URL | |
| Database | |
| Secrets | in the repo's env files, never in the vault |

## Rule

Idea, decision, or status goes in the vault. Code, config, and build output stays in the repo.
