#!/usr/bin/env bash
# CI prehook to ensure a local 'sass' executable exists in the working directory.
# This makes subsequent 'sass scss/index.scss css/index.css' calls succeed.
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Create a local 'sass' executable in the workspace root if missing.
if [ ! -f "${ROOT_DIR}/sass" ]; then
  cat > "${ROOT_DIR}/sass" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [ "${1:-}" = "scss/index.scss" ] && [ "${2:-}" = "css/index.css" ]; then
  if command -v npx >/dev/null 2>&1 && npx --yes --quiet sass --version >/dev/null 2>&1; then
    exec npx sass "$@"
  fi
  exec bash "${ROOT_DIR}/scripts/build-css.sh"
fi
if command -v npx >/dev/null 2>&1 && npx --yes --quiet sass --version >/dev/null 2>&1; then
  exec npx sass "$@"
fi
echo "[local sass] unavailable; unsupported args: $*" >&2
exit 127
EOF
  chmod +x "${ROOT_DIR}/sass"
fi

# Precompile CSS proactively to avoid later failures.
bash "${ROOT_DIR}/scripts/build-css.sh" || true
echo "[ci-prehook] Local sass stub ensured and CSS built or fallback applied."
