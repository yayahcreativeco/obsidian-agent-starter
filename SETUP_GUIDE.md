# Setup Guide

Everything you need to go from an empty Mac to a working AI agent that lives in your notes. Budget about 45 minutes, most of it waiting on downloads.

## What you will have at the end

- **Obsidian**, a notes app, holding a vault organized so an AI agent can work in it
- **Claude Code**, the AI agent, running in Terminal, reading and writing that vault
- **Aqua Voice** (optional), so you can talk to the agent instead of typing
- An agent with a name, who knows your mission, your projects, and the people in your life, and remembers between sessions

---

## Step 1: Install Obsidian (your notes app)

Obsidian is where all your notes, tasks, and projects live. It is free.

1. Go to https://obsidian.md
2. Click "Get Obsidian for macOS"
3. Open the downloaded `.dmg` file
4. Drag Obsidian to your Applications folder
5. Open Obsidian (you may need to right-click, then Open, the first time)

Do not create a vault yet. We will do that in Step 4.

---

## Step 2: Install Claude Code (your AI agent)

Claude Code is the AI agent that reads and writes your vault. It runs in your Mac's Terminal.

1. Open Terminal (press Cmd + Space, type "Terminal", hit Enter)
2. Install Homebrew (Mac's package manager). Paste this and hit Enter:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Follow the prompts. It may ask for your Mac password.

3. Install Node.js and the GitHub CLI:

```bash
brew install node gh
```

4. Install Claude Code:

```bash
npm install -g @anthropic-ai/claude-code
```

5. You will need a Claude Pro subscription if you do not already have one. Sign up at https://claude.ai

---

## Step 3: Install Aqua Voice (voice dictation, optional)

Aqua Voice lets you speak to your agent instead of typing. It works across all apps.

1. Go to https://withaqua.com (or search "Aqua Voice" in the Mac App Store)
2. Download and install the app
3. Open Aqua Voice and follow the setup wizard
4. Grant microphone permissions when prompted
5. The free tier gives you a starting word allowance, then a monthly fee

Tip: hold the hotkey and speak. Aqua converts speech to text wherever your cursor is, including Terminal.

---

## Step 4: Install the starter vault

This pulls down the pre-built vault with the agent's skills and commands.

The repo is private, so whoever is helping you set up will log in with their GitHub account for this step and log out at the end.

1. In Terminal, go to your Documents folder:

```bash
cd ~/Documents
```

2. Log in to GitHub (the helper does this with their account):

```bash
gh auth login
```

3. Clone the starter vault into a folder called "My Vault":

```bash
gh repo clone yayahcreativeco/obsidian-agent-starter "My Vault"
```

4. Go into the folder and run the setup script:

```bash
cd "My Vault"
./setup.sh
```

It asks for your first name, what you want to call your agent, and your timezone. It fills those in everywhere, renames the agent's files, removes the template's git history so your vault starts fresh, and offers to create a private GitHub repo of your own for backup.

5. Log the helper out of GitHub on your machine:

```bash
gh auth logout
```

6. Open in Obsidian: click "Open folder as vault", navigate to Documents, select "My Vault", click Open.

---

## Step 5: Personalize your vault

Open these files in Obsidian and fill them in. Each has italic prompts telling you what to write and why.

1. `CLAUDE.md`: your names are already filled in. Read the whole thing once. Edit the Roles section and anything in Boundaries or Communication Style that is not how you want your agent to act.
2. `10_Command Center/My Mission Document.md`: mission, current focus, constraints, roles, values, the people in your life. This is the single highest-value hour you will spend.
3. `10_Command Center/Vault Index.md`: your Areas (ongoing responsibilities) and Projects (things with an end). Delete the example rows.
4. `10_Command Center/Daily Habits.md`: your real daily habits, 3 to 6 of them.

The example Area, Project, and Person files are there so you can see finished ones. Delete them when you have real ones.

---

## Step 6: Start your first session

1. In Terminal:

```bash
cd ~/Documents/"My Vault"
```

2. Run:

```bash
claude
```

3. The first run opens a browser to authenticate. Log in with your Claude account.
4. Once in, type:

```
/prime
```

The agent loads your vault and tells you what it sees. It will also tell you which files still have placeholders left to fill.

---

## Step 7: Install recommended Obsidian plugins

In Obsidian: Settings, then Community Plugins, then turn on community plugins. Search for and install:

- **Tasks**: due dates and task management. The vault's task syntax depends on this one.
- **Dataview**: dynamic queries across your vault
- **Templater**: advanced templates
- **Calendar**: visual calendar for daily notes

---

## Step 8: Your first week

| Day | Do this |
|-----|---------|
| 1 | `/prime`, then `/create-daily-note`. Ask the agent to summarize what it understands about you from the Mission Document. Fix what it got wrong. |
| 2 | Create your first real Area COP: "Create a COP for my Health area" (or whatever matters most). |
| 3 | Create your first Project COP. Add two tasks to the agent's queue. |
| 4 | Add the three people you talk about most as Person notes. |
| 5 | Try `/plan-feature` on something small, read the spec, then `/execute` it in a fresh session. |
| 7 | `/weekly-review`. See what the agent noticed. Approve or decline its suggestions. |

Read `10_Command Center/Agent Training Guide.md` sometime this week.

---

## Key commands to know

| Command | What it does |
|---------|-------------|
| `/prime` | Load vault context. Run every session. |
| `/create-daily-note` | Today's daily note plus habit tasks |
| `/plan-feature <desc>` | Plan before building. Writes a spec. |
| `/execute <spec>` | Build from a spec in a fresh session |
| `/handoff` | Save session state when context gets heavy |
| `/weekly-review` | Weekly reflection and memory cleanup |
| `/memory-compact` | Mid-week memory cleanup |
| `/commit` | Save changes to git with a useful message |
| `/council <decision>` | Pressure-test a big decision |
| `/command-create <desc>` | Teach the agent a new command |
