# CI Integration

If your CI step runs:
  sass scss/index.scss css/index.css

Add this preparatory step immediately before it:
  bash scripts/ci-prehook.sh

What it does:
- Ensures a local executable named `sass` exists in the repository root (picked up by many CI runners).
- Pre-builds CSS using scripts/build-css.sh which compiles via npx sass or falls back to css/index.fallback.css.

This avoids relying on a globally installed `sass` binary and makes the existing pipeline work without further changes.
