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

# Cursor and Zed-compatible user/global skills.
install_link "$HOME/.agents/skills/teach"

# Cursor's dedicated user skill directory.
install_link "$HOME/.cursor/skills/teach"

# Antigravity IDE global skills.
install_link "$HOME/.gemini/config/skills/teach"

echo
 echo "Done. Restart/open your coding agent if it does not immediately refresh skills."
echo "Then invoke /teach."
