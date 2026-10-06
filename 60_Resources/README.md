# 60_Resources

Knowledge that outlives any single project. Reference notes by topic, reusable prompts, guides, and the **People** folder.

## Structure

```
60_Resources/
  People/
    Person - {Full Name}.md     <- one per person worth tracking
    Group - {Group Name}.md     <- optional, for clusters of people
  {Topic}/                      <- optional topic folders as they grow
  Prompt - {Name}.md            <- reusable prompts you give the agent often
  Guide - {Name}.md             <- how-tos and reference guides
```

## People

The People folder is where the agent keeps relationship context: who someone is, how you know them, what matters to them, when you last talked. Start with the people you mention most. Create from `80_Templates/Person Template.md` and add a row to the People Registry in `10_Command Center/Vault Index.md`.

Why this matters: the agent can only help you prepare for a meeting, remember a birthday, or draft a thoughtful message if it knows who the person is. One good Person note replaces re-explaining the relationship every session.

Keep sensitive details (health, legal, financial) out unless you truly need the agent to work with them. This vault syncs to Git.

## Reusable prompts

When you notice yourself typing the same multi-sentence instruction to the agent more than twice, save it as `Prompt - {Name}.md` here. Then you can say "run the organize-project prompt" and the agent reads it. If it becomes routine, promote it to a slash command with `/command-create`.

## Example

`People/Person - Example.md` is a filled-in sample. Delete it once you have a real one.
