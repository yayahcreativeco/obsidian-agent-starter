#!/usr/bin/env bash
# setup.sh: personalize the Obsidian Agent Starter vault.
#
# Run from inside the cloned vault folder:
#   cd ~/Documents/"My Vault" && ./setup.sh
#
# What it does:
#   1. Asks for your first name, your agent's name, and your timezone
#   2. Replaces every placeholder in file contents
#   3. Renames files and folders that have [AGENT_NAME] in their name
#   4. Creates the empty working folders
#   5. Removes the template's git history and starts a fresh repo for your vault
#   6. Optionally creates a private GitHub repo and pushes to it

set -euo pipefail

VAULT="$(cd "$(dirname "$0")" && pwd)"
cd "$VAULT"

bold() { printf '\033[1m%s\033[0m\n' "$*"; }
ask() {
  local prompt="$1" default="${2:-}" reply
  if [ -n "$default" ]; then
    read -r -p "$prompt [$default]: " reply
    printf '%s' "${reply:-$default}"
  else
    while true; do
      read -r -p "$prompt: " reply
      [ -n "$reply" ] && { printf '%s' "$reply"; return; }
    done
  fi
}

if ! grep -rqF '[USER_NAME]' --exclude-dir=.git --exclude=setup.sh --exclude=SANITIZATION_CHECKLIST.md --exclude=README.md . 2>/dev/null; then
  bold "This vault has already been personalized. Nothing to do."
  exit 0
fi

bold "Obsidian Agent Starter: setup"
echo
echo "Three questions. You can change any of these later by editing CLAUDE.md."
echo

USER_NAME="$(ask "Your first name")"
AGENT_NAME="$(ask "What do you want to call your agent")"
DEFAULT_TZ="$( (readlink /etc/localtime 2>/dev/null | sed 's|.*/zoneinfo/||') || true)"
DEFAULT_TZ="${DEFAULT_TZ:-America/Chicago}"
TIMEZONE="$(ask "Your timezone (IANA name)" "$DEFAULT_TZ")"

USER_NAME_LOWER="$(printf '%s' "$USER_NAME" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')"
AGENT_NAME_LOWER="$(printf '%s' "$AGENT_NAME" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')"

echo
bold "Settings"
echo "  User:     $USER_NAME ($USER_NAME_LOWER)"
echo "  Agent:    $AGENT_NAME ($AGENT_NAME_LOWER)"
echo "  Timezone: $TIMEZONE"
echo
read -r -p "Proceed? [Y/n]: " go
case "${go:-Y}" in [Yy]*) ;; *) echo "Aborted."; exit 1;; esac
echo

# 1. Replace placeholders in file contents. Longer tokens first so [USER_NAME_LOWER]
#    is handled before [USER_NAME]. Perl is used because it behaves the same on
#    macOS and Linux and handles the square brackets literally with \Q...\E.
bold "Replacing placeholders in file contents"
export USER_NAME AGENT_NAME TIMEZONE USER_NAME_LOWER AGENT_NAME_LOWER
find . -type f \
  -not -path './.git/*' \
  -not -name 'setup.sh' \
  -not -name 'SANITIZATION_CHECKLIST.md' \
  -not -name '.DS_Store' \
  -not -name '*.png' -not -name '*.jpg' -not -name '*.pdf' \
  -print0 \
  | xargs -0 perl -pi -e '
      s/\Q[USER_NAME_LOWER]\E/$ENV{USER_NAME_LOWER}/g;
      s/\Q[AGENT_NAME_LOWER]\E/$ENV{AGENT_NAME_LOWER}/g;
      s/\Q[USER_NAME]\E/$ENV{USER_NAME}/g;
      s/\Q[AGENT_NAME]\E/$ENV{AGENT_NAME}/g;
      s/\Q[TIMEZONE]\E/$ENV{TIMEZONE}/g;
    '
echo "  done"

# 2. Rename files and folders. Deepest first so parent renames do not break child paths.
bold "Renaming agent files and folders"
find . -depth -not -path './.git/*' -name '*\[AGENT_NAME\]*' -print0 \
  | while IFS= read -r -d '' path; do
      dir="$(dirname "$path")"
      base="$(basename "$path")"
      newbase="${base//\[AGENT_NAME\]/$AGENT_NAME}"
      mv "$path" "$dir/$newbase"
      echo "  $base  ->  $newbase"
    done

# 3. Working folders that ship empty.
bold "Creating working folders"
mkdir -p "00_INBOX/$AGENT_NAME Task Inputs" "00_INBOX/$AGENT_NAME Task Outputs" ".claude/memory" ".claude/scripts"
touch "00_INBOX/$AGENT_NAME Task Inputs/.gitkeep" "00_INBOX/$AGENT_NAME Task Outputs/.gitkeep"
chmod +x .claude/scripts/*.sh .claude/scripts/*.py 2>/dev/null || true
echo "  done"

# 4. Stamp today's date into the Vault Index update log and Memory Bank.
TODAY="$(date '+%Y-%m-%d')"
perl -pi -e "s/^- YYYY-MM-DD: Vault initialized from Mission Document/- $TODAY: Vault initialized from starter template/" "10_Command Center/Vault Index.md"
perl -pi -e "s/^last_compacted: \"\"/last_compacted: \"$TODAY\"/" "10_Command Center/$AGENT_NAME Memory Bank.md"
perl -pi -e "s/^last_updated: \"\"/last_updated: \"$TODAY\"/" "10_Command Center/Vault Index.md" "10_Command Center/Vault SOPs.md" "10_Command Center/Tag Strategy.md"
echo "[$(date '+%Y-%m-%d %H:%M')] [desktop:main] Vault personalized for $USER_NAME, agent named $AGENT_NAME" >> "10_Command Center/$AGENT_NAME Activity Log.md"

# 5. Fresh git history.
echo
bold "Git"
if [ -d .git ]; then
  read -r -p "Remove the template's git history and start a fresh repo for this vault? [Y/n]: " fresh
  case "${fresh:-Y}" in
    [Yy]*)
      rm -rf .git
      git init -q -b main 2>/dev/null || { git init -q && git checkout -q -b main; }
      git add -A
      git -c user.name="${USER_NAME}" -c user.email="${USER_NAME_LOWER}@localhost" commit -q -m "Initialize $USER_NAME's vault from starter template (agent: $AGENT_NAME)"
      echo "  fresh repository created with one commit"
      ;;
    *) echo "  kept existing history";;
  esac
fi

# 6. Optional private GitHub repo.
if command -v gh >/dev/null 2>&1 && gh auth status >/dev/null 2>&1; then
  echo
  GH_USER="$(gh api user -q .login 2>/dev/null || echo "")"
  echo "GitHub CLI is logged in as: ${GH_USER:-unknown}"
  echo "If that is the HELPER's account and not $USER_NAME's, answer No here. Create the repo"
  echo "later after $USER_NAME runs 'gh auth login' with their own account."
  read -r -p "Create a private GitHub repo for this vault under ${GH_USER:-this account} and push? [y/N]: " mk
  case "${mk:-N}" in
    [Yy]*)
      REPO_NAME="$(ask "Repo name" "my-vault")"
      if gh repo create "$REPO_NAME" --private --source=. --remote=origin --push; then
        echo "  pushed to GitHub. Backups: run .claude/scripts/vault-commit.sh on a schedule."
      else
        echo "  repo creation failed. You can retry later with:"
        echo "    gh repo create my-vault --private --source=. --remote=origin --push"
      fi
      ;;
    *) echo "  skipped. Later: gh repo create my-vault --private --source=. --remote=origin --push";;
  esac
fi

echo
bold "Done. Next steps"
cat <<EOF
  1. Open Obsidian, choose "Open folder as vault", and pick this folder:
       $VAULT
  2. Fill in, in this order:
       10_Command Center/My Mission Document.md
       10_Command Center/Vault Index.md
       10_Command Center/Daily Habits.md
       CLAUDE.md (read it through, edit the Roles section)
  3. In Terminal:
       cd "$VAULT" && claude
     then type /prime
  4. Install the Obsidian plugins listed in SETUP_GUIDE.md step 7 (Tasks is required).
  5. If a helper logged into GitHub on this machine, run: gh auth logout

  Your agent is named $AGENT_NAME. Read 10_Command Center/Agent Training Guide.md this week.
EOF
