---
name: cop-manager
description: Create, update, assess, and brief on COPs (Common Operating Pictures) for Areas and Projects. Use when the user says "cop", "create a cop", "update the cop", "cop brief", "assess", "RFI", or asks where a project or area stands.
---

# COP Manager

A COP is the single authoritative one-page picture of an Area or Project, shared between [USER_NAME] and [AGENT_NAME]. This skill covers the five workflows and the permission rules.

## Locations

- Area COPs: `40_Areas/Area - {Name}/COP - {Name}.md`
- Project COPs: `50_Projects/COP - {Name}.md`
- Templates: `80_Templates/COP - Area.md`, `80_Templates/COP - Project.md`

## Permissions

| Agent may edit directly | Agent must propose, owner approves |
|------------------------|-----------------------------------|
| Conclusions & Recommendations | Mission |
| Situation Log | End State / Desired Steady State |
| Tasks | Critical Tasks |
| RFIs | Running Estimate (Facts, Assumptions, Constraints) |
| Key Metrics | Decision Points |
| Rhythms & Habits | Dependencies |
| Key People | |
| Resources & Links | |

"Propose" means: write the suggested text in the conversation, ask, and only edit the file after a yes.

## Workflows

### Create
1. Confirm Area vs Project (does it end?).
2. Copy the matching template. Fill frontmatter. Replace `{{title}}` and dates.
3. Draft Mission and End State from what [USER_NAME] said, mark them as proposals, get approval.
4. Save to the correct location. Add a row to `Vault Index.md`. Add to the Memory Bank Project Context.
5. First Situation Log entry: "COP created."

### Update
1. Read the COP. Identify which section the change touches.
2. If it is an owner-only section, propose. Otherwise edit.
3. Always add a dated Situation Log entry (newest first) and bump `last_updated`.
4. If status changed, update `Vault Index.md` and the Memory Bank.

### Brief
Across all COPs (or a filtered set): one line per COP with status, days since last update, open RFIs, next Decision Point. Alerts first. This is the format `/prime` uses for the COP Status block.

### Assess
Deep read of one COP. Check: is the Mission still true, does the Running Estimate match reality, are Tasks moving, are RFIs stale, are Decision Points approaching. Write findings into Conclusions & Recommendations and a Situation Log entry. Flag anything that needs an owner decision.

### RFI
Work an open Request for Information: research it (sub-agent if large), write the answer under the RFI, mark it closed with the date, and if the answer changes a Fact or Assumption, propose that change.

## Status values

`green` on track, `amber` at risk, `red` blocked or off track. Set in frontmatter `status` for projects; areas use `active`, `on-hold`, `closed`.
