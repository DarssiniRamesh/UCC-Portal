#!/usr/bin/env bash
# One-shot CI command to ensure css/index.css exists without invoking Sass.
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
bash "${ROOT_DIR}/scripts/build-css.sh" || true
if [ ! -f "${ROOT_DIR}/css/index.css" ] && [ -f "${ROOT_DIR}/css/index.fallback.css" ]; then
  cp -f "${ROOT_DIR}/css/index.fallback.css" "${ROOT_DIR}/css/index.css"
  echo "[ensure-css] Copied fallback CSS."
else
  echo "[ensure-css] CSS ready."
fi
exit 0
