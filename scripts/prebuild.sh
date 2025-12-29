#!/usr/bin/env bash
set -euo pipefail
# Ensure sass is available; if not, install dependencies, then build CSS.
if ! npx --yes --quiet sass --version >/dev/null 2>&1; then
  echo "sass not found, installing devDependencies..."
  if [ -f package-lock.json ]; then
    npm ci --no-audit --no-fund
  else
    npm install --no-audit --no-fund
  fi
fi
npx --yes sass scss/index.scss css/index.css
echo "SCSS compiled successfully."
