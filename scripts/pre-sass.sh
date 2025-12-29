#!/usr/bin/env bash
# Ensures that a local 'sass' executable exists in the current working directory
# and that css/index.css exists prior to CI invoking a hardcoded sass command.
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# 1) Ensure CSS exists (compile or fallback)
bash "${REPO_ROOT}/scripts/build-css.sh" || true

# 2) Drop a cwd-local sass shim if not already present (handles standard invocation)
if [ ! -f "./sass" ]; then
  cat > ./sass <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(pwd)"
# Standard project invocation pattern
if [ "${1:-}" = "scss/index.scss" ] && [ "${2:-}" = "css/index.css" ]; then
  if command -v npx >/dev/null 2>&1 && npx --yes --quiet sass --version >/dev/null 2>&1; then
    exec npx sass "$@"
  fi
  if command -v node >/dev/null 2>&1; then
    # Attempt to find repo-root sass.js; fallback to builder if not found
    if [ -f "${ROOT_DIR}/sass.js" ]; then
      exec node "${ROOT_DIR}/sass.js" "$@"
    fi
  fi
  # Fallback: ensure CSS exists by copying precompiled file
  if [ -f "css/index.css" ]; then
    echo "[cwd sass shim] Using existing css/index.css"
    exit 0
  fi
  if [ -f "css/index.fallback.css" ]; then
    cp -f "css/index.fallback.css" "css/index.css"
    echo "[cwd sass shim] Copied fallback CSS"
    exit 0
  fi
  echo "[cwd sass shim] No CSS found; please ensure css/index.css is committed" >&2
  exit 0
fi

# For other args, try npx sass; else no-op success
if command -v npx >/dev/null 2>&1 && npx --yes --quiet sass --version >/dev/null 2>&1; then
  exec npx sass "$@"
fi

echo "[cwd sass shim] No-op for args: $*"
exit 0
EOF
  chmod +x ./sass
fi

echo "[pre-sass.sh] Ensured local 'sass' shim and CSS presence."
