#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILL_SOURCE="$REPO_ROOT/skills/teach"
LEARNER_CONTEXT="$HOME/.teach/learner-context.md"

install_link() {
  local target="$1"
  mkdir -p "$(dirname "$target")"
  if [[ -e "$target" || -L "$target" ]]; then
    rm -rf "$target"
  fi
  ln -s "$SKILL_SOURCE" "$target"
  echo "Installed /teach -> $target"
}

# 1. Install global skills
install_link "$HOME/.agents/skills/teach"
install_link "$HOME/.cursor/skills/teach"
install_link "$HOME/.gemini/config/skills/teach"

# 2. Sync active learner profile into global rules so AI has context in memory instantly (no tool call needed)
mkdir -p "$HOME/.gemini/config/rules" "$HOME/.agents/rules"

RULE_CONTENT=""
if [[ -f "$LEARNER_CONTEXT" ]]; then
  RULE_CONTENT="$(cat "$LEARNER_CONTEXT")"
else
  RULE_CONTENT="Domain: Healthcare & Clinical Informatics. Habits: Synthetic datasets and simulation."
fi

cat << EOF > "$HOME/.gemini/config/rules/teach.md"
# Active Learner Profile for /teach
Whenever the user invokes /teach, customize all explanations and micro-projects to this learner profile:

$RULE_CONTENT
EOF

cat << EOF > "$HOME/.agents/rules/teach.md"
# Active Learner Profile for /teach
Whenever the user invokes /teach, customize all explanations and micro-projects to this learner profile:

$RULE_CONTENT
EOF

echo "Synced active learner profile into global IDE rules."
echo
echo "Done! Zero-config setup complete. Type /teach [Topic] in any workspace."
