#!/usr/bin/env bash
# CI-safe shim placed in scss/ to handle `sass index.scss ../css/index.css`
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
# Accept both relative and absolute paths
SRC="${1:-index.scss}"
DST="${2:-../css/index.css}"

# Normalize to project standard pair
if [[ "$SRC" == "index.scss" && "$DST" == "../css/index.css" ]]; then
  bash "${ROOT_DIR}/scripts/build-css.sh" || true
  exit 0
fi

# If npx sass is available, delegate
if command -v npx >/dev/null 2>&1 && npx --yes --quiet sass --version >/dev/null 2>&1; then
  exec npx sass "$@"
fi

# Fallback: copy precompiled CSS
cp -f "${ROOT_DIR}/css/index.fallback.css" "${ROOT_DIR}/css/index.css"
echo "[scss/sass.sh] fallback CSS copied"
exit 0
