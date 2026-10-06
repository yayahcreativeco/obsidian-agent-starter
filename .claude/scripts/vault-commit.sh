#!/bin/bash
# vault-commit.sh: auto-commit and push vault changes to GitHub.
# Run by hand, or on a schedule with cron or launchd. Example crontab line (noon and 11:45pm):
#   0 12,23 * * * /path/to/vault/.claude/scripts/vault-commit.sh
#
# The vault root is resolved from this script's location, so no paths need editing.

VAULT="$(cd "$(dirname "$0")/../.." && pwd)"
LOG="$VAULT/.claude/scripts/vault-commit.log"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
BRANCH="${VAULT_BRANCH:-main}"

cd "$VAULT" || { echo "[$TIMESTAMP] ERROR: could not cd to vault" >> "$LOG"; exit 1; }

if [ ! -d .git ]; then
  echo "[$TIMESTAMP] ERROR: vault is not a git repository" >> "$LOG"
  exit 1
fi

git checkout "$BRANCH" >> "$LOG" 2>&1
git add -A

if git diff --cached --quiet; then
  echo "[$TIMESTAMP] No changes to commit" >> "$LOG"
  exit 0
fi

git commit -m "auto: vault save $TIMESTAMP" >> "$LOG" 2>&1

if git remote get-url origin >/dev/null 2>&1; then
  if git push origin "$BRANCH" >> "$LOG" 2>&1; then
    echo "[$TIMESTAMP] Push succeeded" >> "$LOG"
  else
    echo "[$TIMESTAMP] ERROR: push failed" >> "$LOG"
    exit 1
  fi
else
  echo "[$TIMESTAMP] Committed locally (no remote configured)" >> "$LOG"
fi
