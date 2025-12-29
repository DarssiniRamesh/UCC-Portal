#!/usr/bin/env bash
# Shell-level function override for `sass` used by CI shells that source rc.d scripts.
# Ensures css/index.css is present without relying on a global Sass binary.
sass() {
  # Expect: sass scss/index.scss css/index.css
  if [ "${1:-}" = "scss/index.scss" ] && [ "${2:-}" = "css/index.css" ]; then
    if command -v npx >/dev/null 2>&1 && npx --yes --quiet sass --version >/dev/null 2>&1; then
      npx sass "$@"
      return 0
    fi
    bash "$(pwd)/scripts/build-css.sh" || true
    return 0
  fi
  # For other args, try npx sass, otherwise succeed without action
  if command -v npx >/dev/null 2>&1 && npx --yes --quiet sass --version >/dev/null 2>&1; then
    npx sass "$@"
    return $?
  fi
  echo "[.rc.d/sass.sh] No-op for args: $*"
  return 0
}
