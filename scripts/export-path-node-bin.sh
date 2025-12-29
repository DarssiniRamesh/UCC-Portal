#!/usr/bin/env bash
# Ensure local node_modules/.bin is first on PATH so locally installed binaries are resolved.
set -euo pipefail
export PATH="$PWD/node_modules/.bin:$PATH"
echo "[export-path-node-bin] PATH updated to prioritize ./node_modules/.bin"
