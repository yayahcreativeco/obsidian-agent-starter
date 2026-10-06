---
type: reference
description: "Map of where Example Project's notes live (vault) and where its code lives (outside the vault)"
---

# Example Project: Where Things Live

> *Every code-backed project gets one of these. The agent reads it to know where to think (vault) and where to build (repo). Delete this example once you have a real one.*

## Vault side (ideas, decisions, status)

| What | Where |
|------|-------|
| COP | [[COP - Example Project]] |
| Working memory | [[[AGENT_NAME] Working Memory]] |
| Specs | `50_Projects/Example Project/Spec - *.md` |
| Meeting notes | `50_Projects/Example Project/Meeting - *.md` |

## Code side (writing and running the app)

| What | Where |
|------|-------|
| Local path | `~/Development/example-portfolio` |
| GitHub | `github.com/[your-handle]/example-portfolio` |
| Hosting | Netlify (free tier) |
| Live URL | `https://example.com` |
| Database | none |
| Secrets | `.env.local` in the repo, never in the vault |

## Rule

Idea, decision, or status goes in the vault. Code, config, and build output stays in the repo.
