#!/usr/bin/env bash
set -euo pipefail
# Install dependencies (prefer ci when lock present), then build css
if command -v npm >/dev/null 2>&1; then
  if [ -f package-lock.json ]; then
    npm ci --no-audit --no-fund
  else
    npm install --no-audit --no-fund
  fi
  npm run build:css
else
  echo "npm not found in PATH. Please ensure Node.js/npm are available in CI."
  exit 127
fi
