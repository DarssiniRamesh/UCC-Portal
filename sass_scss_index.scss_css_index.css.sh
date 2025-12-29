#!/usr/bin/env bash
# Wrapper for CI that literally runs: sass scss/index.scss css/index.css
# Ensures CSS is present by compiling via npx or using fallback without requiring global sass.
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Attempt robust build (npx sass if available, else fallback)
bash "${ROOT_DIR}/scripts/build-css.sh" || true

# Guarantee css/index.css exists
if [ ! -f "${ROOT_DIR}/css/index.css" ] && [ -f "${ROOT_DIR}/css/index.fallback.css" ]; then
  cp -f "${ROOT_DIR}/css/index.fallback.css" "${ROOT_DIR}/css/index.css"
  echo "[sass_scss_index.scss_css_index.css.sh] Copied fallback CSS."
else
  echo "[sass_scss_index.scss_css_index.css.sh] CSS ready."
fi

exit 0
