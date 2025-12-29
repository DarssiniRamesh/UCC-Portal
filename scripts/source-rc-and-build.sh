#!/usr/bin/env bash
# Sources local rc.d functions (including sass override) and ensures CSS exists.
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Source all rc.d scripts if present
if [ -d "${ROOT_DIR}/.rc.d" ]; then
  for f in "${ROOT_DIR}/.rc.d/"*.sh; do
    [ -f "$f" ] && source "$f"
  done
fi

# Ensure CSS (compile or fallback)
bash "${ROOT_DIR}/scripts/build-css.sh" || true
echo "[source-rc-and-build] RC sourced and CSS ensured."
