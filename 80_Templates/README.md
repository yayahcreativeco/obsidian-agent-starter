# 80_Templates

Templates the agent and the Templater plugin use to create new notes. Do not edit the `{{...}}` variables; they are filled in at creation time.

| Template | Used by | Creates |
|----------|---------|---------|
| `Daily Note Template.md` | `/create-daily-note` | `70_Log/YYYY-MM-DD - Daily Note.md` |
| `Weekly Review Template.md` | `/weekly-review` | `70_Log/YYYY-MM-DD - Weekly Review.md` |
| `COP - Area.md` | cop-manager skill | `40_Areas/Area - {Name}/COP - {Name}.md` |
| `COP - Project.md` | cop-manager skill | `50_Projects/COP - {Name}.md` |
| `Meeting Note Template.md` | "log a meeting" | `Meeting - YYYY-MM-DD - Title.md` in the project folder |
| `Person Template.md` | "add a person" | `60_Resources/People/Person - {Name}.md` |
| `Project README Template.md` | new code-backed project | `50_Projects/{Name}/_README - Where Things Live.md` |
| `Spec Template.md` | `/plan-feature` | `50_Projects/{Name}/Spec - {Feature}.md` |

Add your own templates here and tell the agent what they are for. It will use them.
