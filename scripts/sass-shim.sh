#!/usr/bin/env bash
set -euo pipefail
# Proxy script to invoke sass via npx, ensuring it works without global install.
if ! command -v npx >/dev/null 2>&1; then
  echo "npx not found. Please install Node.js and npm." >&2
  exit 127
fi

# Ensure dev deps exist; try a quick install if missing
if ! npx --yes --quiet sass --version >/dev/null 2>&1; then
  if [ -f package-lock.json ]; then
    npm ci --no-audit --no-fund
  else
    npm install --no-audit --no-fund
  fi
fi

# Forward all args to sass through npx
exec npx sass "$@"
