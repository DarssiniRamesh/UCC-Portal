#!/usr/bin/env bash
# Adds repository shims to PATH so `sass` resolves even if not globally installed.
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
export PATH="$ROOT_DIR:$ROOT_DIR/node_modules/.bin:$PATH"
echo "PATH updated to include repo root and node_modules/.bin"
