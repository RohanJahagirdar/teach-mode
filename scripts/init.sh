#!/usr/bin/env bash
set -euo pipefail

TEACH_HOME="${TEACH_HOME:-$HOME/.teach}"
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

mkdir -p "$TEACH_HOME/knowledge"

if [[ ! -f "$TEACH_HOME/learner-context.md" ]]; then
  cp "$REPO_ROOT/templates/learner-context.md" "$TEACH_HOME/learner-context.md"
  echo "Created $TEACH_HOME/learner-context.md"
else
  echo "Keeping existing $TEACH_HOME/learner-context.md"
fi

if [[ ! -f "$TEACH_HOME/learning-backlog.md" ]]; then
  cp "$REPO_ROOT/templates/learning-backlog.md" "$TEACH_HOME/learning-backlog.md"
  echo "Created $TEACH_HOME/learning-backlog.md"
else
  echo "Keeping existing $TEACH_HOME/learning-backlog.md"
fi

echo "Personal teach state initialized at $TEACH_HOME"
