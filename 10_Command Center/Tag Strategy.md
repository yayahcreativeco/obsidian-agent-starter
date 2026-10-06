---
type: reference
description: "Tag taxonomy for this vault. Consistent tags make Dataview and Tasks queries work."
last_updated: ""
---

# Tag Strategy

Tags are hierarchical and lowercase. A small, consistent set beats a large creative one. If you want a new tag, add it here first.

> *Edit the `#role/*` list to match the Roles in your Mission Document. Everything else can stay as shipped until you find a reason to change it.*

---

## Role tags (frontmatter)

Which hat a note belongs to. Mirror your roles from `My Mission Document.md`.

| Tag | Use for |
|-----|---------|
| `#role/professional` | Day job, career, employer work |
| `#role/builder` | Ventures, side projects, things you are creating |
| `#role/partner` | Relationship with your spouse or partner |
| `#role/parent` | Kids, school, family logistics |
| `#role/self` | Health, faith, learning, finances, personal growth |

---

## Kind tags (frontmatter)

What kind of note this is. Matches the `type` field.

| Tag | `type` value | Use for |
|-----|-------------|---------|
| `#kind/resource_note` | `resource_note` | Reference knowledge on a topic |
| `#kind/meeting` | `meeting` | Meeting notes |
| `#kind/idea` | `idea` | Captured ideas not yet projects |
| `#kind/quote` | `quote` | Quotes and mantras |
| `#kind/person` | `person` | People notes |
| `#kind/decision` | `decision` | A recorded decision with reasoning |
| `#kind/spec` | `spec` | A plan or build spec from `/plan-feature` |

Other `type` values without a kind tag: `cop`, `daily_note`, `weekly_review`, `index`, `reference`, `task_queue`, `session_scratch`, `template`.

---

## Review tags (frontmatter)

How often the note should be revisited.

| Tag | Meaning |
|-----|---------|
| `#review/weekly` | Pulled into `/weekly-review` |
| `#review/monthly` | Checked monthly |
| `#review/annual` | Checked at year planning |

---

## Inline tags (tasks only)

| Tag | Meaning |
|-----|---------|
| `#top3` | One of today's three most important tasks |
| `#10min` | Can be done in a ten-minute gap |
| `#status/blocked` | Waiting on someone or something |
| `#status/waiting` | Delegated, awaiting response |

---

## Project and area tags (optional)

Add a short slug tag per project or area when you want to pull its tasks together across files, for example `#website-launch` or `#health`. Use the same slug as the Area ID or project name in `Vault Index.md`.

---

## Rules

1. Lowercase, hyphens between words, slash for hierarchy.
2. Frontmatter tags are quoted strings: `tags: ["#role/self", "#kind/idea"]`.
3. No tags in note bodies except task inline tags.
4. Before adding a tag not listed here, add it to this file.
