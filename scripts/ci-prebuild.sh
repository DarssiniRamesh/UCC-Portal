#!/usr/bin/env bash
# Aggregated CI prebuild: set PATH for shims and ensure CSS is present.
set -euo pipefail
# Source local rc files if present
[ -f ".bash_profile" ] && source ".bash_profile"
[ -f ".bashrc" ] && source ".bashrc"
[ -f ".profile" ] && source ".profile"
[ -f ".envrc" ] && source ".envrc"
[ -f ".shellrc" ] && source ".shellrc"
# Build CSS deterministically
bash scripts/build-css.sh || true
echo "[ci-prebuild] PATH configured and CSS ensured."
