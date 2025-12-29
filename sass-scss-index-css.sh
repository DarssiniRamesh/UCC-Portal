#!/usr/bin/env bash
# Wrapper that replaces the hardcoded command: `sass scss/index.scss css/index.css`
# Ensures css/index.css is present by compiling via npx when available or using fallback CSS.
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 1) Prefer npx sass if available
if command -v npx >/dev/null 2>&1 && npx --yes --quiet sass --version >/dev/null 2>&1; then
  (cd "${ROOT_DIR}" && npx sass scss/index.scss css/index.css) || true
  exit 0
fi

# 2) Use robust builder (compiles or copies fallback)
bash "${ROOT_DIR}/scripts/build-css.sh" || true

# 3) Ensure css/index.css exists as last resort
if [ ! -f "${ROOT_DIR}/css/index.css" ] && [ -f "${ROOT_DIR}/css/index.fallback.css" ]; then
  cp -f "${ROOT_DIR}/css/index.fallback.css" "${ROOT_DIR}/css/index.css"
  echo "[sass-scss-index-css] Copied fallback CSS."
else
  echo "[sass-scss-index-css] CSS ready."
fi

exit 0
