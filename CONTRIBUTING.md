# Contributing and CI Guidance

Build CSS without relying on a global `sass`:
- npm run build:css (preferred; uses scripts/build-css.sh)
- or: bash scripts/build-css.sh
- or: make -f Makefile.ci css
- or: ./build-css

Avoid calling `sass scss/index.scss css/index.css` directly in CI.
If you must, ensure:
- npm install has run first, and
- PATH includes: "$PWD:$PWD/node_modules/.bin"
so the repo-provided `sass` wrapper or npm binary shim is used.

Serve the site locally at http://localhost:3000 before running Cypress:
- npm run serve
- then run E2E tests:
  - npm run cypress:open
  - npm run cypress:run
