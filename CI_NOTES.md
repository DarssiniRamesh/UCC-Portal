# CI Configuration Notes

If your CI runs `sass scss/index.scss css/index.css` directly, ensure the repository root is first in PATH, or ensure npm scripts are used.

Recommended steps:
- npm install --no-audit --no-fund
- bash scripts/ensure-sass-in-path.sh
- sass scss/index.scss css/index.css

This repo includes:
- ./sass and ./sass.sh wrappers that call npx sass (with auto-install) and fall back to css/index.fallback.css
- npm run build:css which uses a safe wrapper and fallback
- An npm binary shim at node_modules/.bin/sass created by the prepare step
