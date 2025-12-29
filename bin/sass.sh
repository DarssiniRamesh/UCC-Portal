#!/usr/bin/env bash
# Exact-name sass shim designed for CI that invokes: sass scss/index.scss css/index.css
# Tries npx sass if available; otherwise, uses fallback builder to copy precompiled CSS.
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if [ "${1:-}" = "scss/index.scss" ] && [ "${2:-}" = "css/index.css" ]; then
  # Attempt with npx sass
  if command -v npx >/dev/null 2>&1 && npx --yes --quiet sass --version >/dev/null 2>&1; then
    exec npx sass "$@"
  fi

  # Attempt with global sass
  if command -v sass >/dev/null 2>&1; then
    exec sass "$@"
  fi

  # Fallback to robust builder (installs if needed and/or copies fallback)
  exec bash "${ROOT_DIR}/scripts/build-css.sh"
fi

# Non-standard args: try npx sass, else fail
if command -v npx >/dev/null 2>&1 && npx --yes --quiet sass --version >/dev/null 2>&1; then
  exec npx sass "$@"
fi

echo "[bin/sass.sh] sass unavailable and unsupported args: $*" >&2
exit 127
