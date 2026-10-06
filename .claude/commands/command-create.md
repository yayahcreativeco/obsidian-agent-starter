---
description: "Create a new Claude Code slash command from a user request"
---

# Create Claude Command

## Feature: $ARGUMENTS

## Context (INPUT)

You are creating a new Claude Code slash command. Commands follow the **INPUT → PROCESS → OUTPUT** structure:

- **INPUT**: What context does the agent need to succeed?
- **PROCESS**: What steps should the agent follow?
- **OUTPUT**: What format should the response take?

### Command File Requirements

- Location: `.claude/commands/<command-name>.md`
- Format: Markdown with optional YAML frontmatter
- Use `$ARGUMENTS` to capture user input

## Process (PROCESS)

### Step 1: Understand the Request

Analyze what the command should do, when it triggers, and what it produces.

### Step 2: Design the Command Structure

1. **Command name**: kebab-case, descriptive
2. **INPUT section**: Essential context
3. **PROCESS section**: Clear numbered steps
4. **OUTPUT section**: Structured response format

### Step 3: Write the Command

Create a complete command file with clear language and specific steps.

### Step 4: Save the Command

Write to `.claude/commands/<command-name>.md`

## Output Format (OUTPUT)

```
## Command Created

**File**: `.claude/commands/<command-name>.md`
**Purpose**: <one-line description>

### Usage
`/<command-name> <arguments if any>`
```
