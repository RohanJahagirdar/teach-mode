#!/usr/bin/env bash
set -euo pipefail

TEACH_HOME="${TEACH_HOME:-$HOME/.teach}"

printf 'teach-mode status\n'
printf '%s\n' '=================' 
printf 'Local state: %s\n' "$TEACH_HOME"
[[ -f "$TEACH_HOME/learner-context.md" ]] && echo '  learner-context.md: OK' || echo '  learner-context.md: MISSING'
[[ -f "$TEACH_HOME/learning-backlog.md" ]] && echo '  learning-backlog.md: OK' || echo '  learning-backlog.md: MISSING'
[[ -d "$TEACH_HOME/knowledge" ]] && echo '  knowledge/: OK' || echo '  knowledge/: MISSING'

for p in \
  "$HOME/.agents/skills/teach" \
  "$HOME/.cursor/skills/teach" \
  "$HOME/.gemini/config/skills/teach"; do
  if [[ -L "$p" ]]; then
    printf '  %s -> %s\n' "$p" "$(readlink "$p")"
  elif [[ -d "$p" ]]; then
    printf '  %s -> directory\n' "$p"
  else
    printf '  %s -> NOT INSTALLED\n' "$p"
  fi
done
