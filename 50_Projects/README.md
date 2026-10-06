# 50_Projects

A **Project** has a defined outcome and will end. Launch the site. Finish the course. Plan the trip. Hire the contractor. If you cannot say when it is done, it is an Area, not a Project.

## Structure

```
50_Projects/
  COP - {Project Name}.md              <- required, one per project, at this level
  {Project Name}/                      <- optional folder for supporting notes
    _README - Where Things Live.md     <- required if the project has code
    [AGENT_NAME] Working Memory.md     <- the agent creates this as it works
    Meeting - YYYY-MM-DD - Title.md
    Spec - Feature Name.md
    (other notes)
```

Create a new project from `80_Templates/COP - Project.md`, then add a row to the Active Projects table in `10_Command Center/Vault Index.md`.

## Why the COP sits at the top level

The agent globs `50_Projects/COP - *.md` at `/prime`. Keeping COPs at the top level means one glob finds them all, and you can see every project's status in one folder listing.

## Projects with code

Code never goes in the vault. It bloats Obsidian and burns the agent's context. Instead, every code-backed project has a `_README - Where Things Live.md` that maps:

- **Vault side:** the COP, specs, meeting notes, decisions
- **Code side:** local path, GitHub repo, hosting, database, live URL

The agent reads that README and knows to `cd` to the code directory for building and stay in the vault for thinking.

## When a project ends

Move the COP and its folder to `90_Archive/`, change the status in `Vault Index.md` to `completed`, and tell the agent so the Memory Bank gets updated.

## Example

`COP - Example Project.md` and `Example Project/` are a filled-in sample for a fictional person. Delete them once you have a real project.
