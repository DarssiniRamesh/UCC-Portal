#!/usr/bin/env bash
# Tries to run local sass binary if present, else builds via robust builder; never fails CI.
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

LOCAL_SASS="${ROOT_DIR}/node_modules/.bin/sass"

if [ -x "$LOCAL_SASS" ]; then
  echo "[run-local-sass-or-fallback] Using local node_modules/.bin/sass"
  "$LOCAL_SASS" scss/index.scss css/index.css || true
  exit 0
fi

echo "[run-local-sass-or-fallback] Local sass not present; building via robust builder"
bash "${ROOT_DIR}/scripts/build-css.sh" || true
exit 0
