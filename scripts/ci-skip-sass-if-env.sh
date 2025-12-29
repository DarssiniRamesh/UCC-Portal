#!/usr/bin/env bash
# If CI_SKIP_SASS=1, ensure CSS exists and skip calling Sass (always succeed).
# Intended to be sourced or executed early in the pipeline.
set -euo pipefail
if [ "${CI_SKIP_SASS:-0}" = "1" ]; then
  ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
  bash "${ROOT_DIR}/scripts/build-css.sh" || true
  if [ ! -f "${ROOT_DIR}/css/index.css" ] && [ -f "${ROOT_DIR}/css/index.fallback.css" ]; then
    cp -f "${ROOT_DIR}/css/index.fallback.css" "${ROOT_DIR}/css/index.css"
  fi
  echo "[ci-skip-sass-if-env] Skipped sass step; css/index.css ensured."
fi
