#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILL_SOURCE="$REPO_ROOT/skills/teach"

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

# 2. Install global rules so context is always loaded automatically
mkdir -p "$HOME/.gemini/config/rules" "$HOME/.agents/rules"

cat << 'EOF' > "$HOME/.gemini/config/rules/teach.md"
# Teach Mode Pre-flight Rule
Whenever the user invokes `/teach`, you MUST execute `cat ~/.teach/learner-context.md` to inspect their domain background before generating your response. Ground all explanations and micro-projects in their domain.
EOF

cat << 'EOF' > "$HOME/.agents/rules/teach.md"
# Teach Mode Pre-flight Rule
Whenever the user invokes `/teach`, you MUST execute `cat ~/.teach/learner-context.md` to inspect their domain background before generating your response. Ground all explanations and micro-projects in their domain.
EOF

echo "Installed global rules for automatic context loading."
echo
echo "Done! Zero-config setup complete. Just type /teach [Topic] in any workspace."
