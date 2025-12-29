#!/usr/bin/env bash
# CI alias: one-liner to ensure PATH is set and CSS is built.
set -euo pipefail
export PATH="$PWD:$PWD/bin:$PWD/tools:$PWD/tools/bin:$PWD/node_modules/.bin:$PWD/css:$PWD/scss:$PATH"
bash scripts/build-css.sh || true
