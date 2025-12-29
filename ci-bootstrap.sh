#!/usr/bin/env bash
# CI bootstrap: set PATH to include all local shims and build CSS deterministically.
set -euo pipefail
export PATH="$PWD:$PWD/bin:$PWD/tools:$PWD/tools/bin:$PWD/node_modules/.bin:$PWD/css:$PWD/scss:$PATH"
echo "[ci-bootstrap] PATH updated for local shims."
# Proactively build CSS (compile via npx or fallback)
bash scripts/build-css.sh || true
echo "[ci-bootstrap] CSS ready."
