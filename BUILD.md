# Build Instructions

This project uses SCSS compiled to CSS. To build CSS deterministically across environments (including CI), use:

- npm run build:css
  - Internally calls scripts/build-css.sh
  - Attempts to use npx sass (or global sass); if unavailable, falls back to committed css/index.fallback.css

CI recommendation:
- npm install --no-audit --no-fund  (creates a local sass binary shim and triggers postinstall which compiles CSS or falls back)
  - On Windows runners, npm will link both node_modules/.bin/sass and node_modules/.bin/sass.cmd to the local shim
- npm run build:css                 (optional explicit build; safe to run multiple times)
- Serve the site at http://localhost:3000 for Cypress tests
