#!/usr/bin/env bash
# Unified build script for CSS that CI can call directly.
# Tries to use sass (npx or local), else falls back to committed CSS.
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC_SCSS="scss/index.scss"
OUT_CSS="css/index.css"
FALLBACK_CSS="css/index.fallback.css"

cd "$ROOT_DIR"

echo "[build-css] Attempting to compile SCSS -> CSS"

if command -v npx >/dev/null 2>&1 && npx --yes --quiet sass --version >/dev/null 2>&1; then
  npx sass "$SRC_SCSS" "$OUT_CSS"
  echo "[build-css] Built with npx sass"
  exit 0
fi

if command -v sass >/dev/null 2>&1; then
  sass "$SRC_SCSS" "$OUT_CSS"
  echo "[build-css] Built with global sass"
  exit 0
fi

# Try to install dependencies quickly and retry
if command -v npm >/dev/null 2>&1; then
  echo "[build-css] Installing dev dependencies to obtain sass..."
  if [ -f package-lock.json ]; then
    npm ci --no-audit --no-fund || true
  else
    npm install --no-audit --no-fund || true
  fi
  if command -v npx >/dev/null 2>&1 && npx --yes --quiet sass --version >/dev/null 2>&1; then
    npx sass "$SRC_SCSS" "$OUT_CSS"
    echo "[build-css] Built with npx sass after install"
    exit 0
  fi
fi

echo "[build-css] sass unavailable; copying fallback CSS"
cp -f "$FALLBACK_CSS" "$OUT_CSS"
exit 0
