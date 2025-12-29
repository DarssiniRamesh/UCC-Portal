#!/usr/bin/env bash
# Runs before test/build to ensure CSS exists without requiring global Sass.
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
bash "${ROOT_DIR}/scripts/build-css.sh" || true
if [ ! -f "${ROOT_DIR}/css/index.css" ] && [ -f "${ROOT_DIR}/css/index.fallback.css" ]; then
  cp -f "${ROOT_DIR}/css/index.fallback.css" "${ROOT_DIR}/css/index.css"
  echo "[prebuild-hook] Copied fallback CSS."
else
  echo "[prebuild-hook] CSS ready."
fi
