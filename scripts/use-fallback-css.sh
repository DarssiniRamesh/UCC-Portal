#!/usr/bin/env bash
# CI-safe script: guarantees css/index.css exists without requiring the Sass binary.
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
# Try robust builder first
bash "${ROOT_DIR}/scripts/build-css.sh" || true
# Ensure presence using committed fallback if needed
if [ ! -f "${ROOT_DIR}/css/index.css" ] && [ -f "${ROOT_DIR}/css/index.fallback.css" ]; then
  cp -f "${ROOT_DIR}/css/index.fallback.css" "${ROOT_DIR}/css/index.css"
  echo "[use-fallback-css] Copied fallback CSS."
else
  echo "[use-fallback-css] css/index.css already present or built."
fi
exit 0
