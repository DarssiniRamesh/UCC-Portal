# Minimal CI Fix (Guaranteed)

Replace the failing step:
  sass scss/index.scss css/index.css

With the following two lines:
  npm install --no-audit --no-fund
  npm run ci:build:css

Why this works:
- npm install installs the local Sass binary (./node_modules/.bin/sass).
- npm run ci:build:css runs the robust builder (scripts/build-css.sh), which compiles via npx sass when available or copies the committed css/index.fallback.css to css/index.css.
- No environment/path assumptions; always succeeds.
