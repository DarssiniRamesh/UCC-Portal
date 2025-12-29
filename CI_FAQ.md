# CI FAQ: Handling `sass` command

Q: Our CI calls `sass scss/index.scss css/index.css` and fails with `sass: command not found`.
A: This repo provides multiple shims to resolve the command without a global install:
- node_modules/.bin/sass (committed stub)
- ./sass and ./sass.sh at repo root
- ./bin/sass and ./bin/sass.sh
- ./tools/sass and ./tools/bin/sass
- ./scss/sass (for runners that change into scss/ before invoking)
- scripts/build-css.sh (robust builder used by all wrappers)

Preferred CI usage:
- npm install --no-audit --no-fund
- npm run build:css   (delegates to scripts/build-css.sh)
- Serve on http://localhost:3000 and run Cypress

If the pipeline step cannot change and still invokes `sass ...`, ensure PATH includes:
- $PWD:$PWD/bin:$PWD/tools:$PWD/tools/bin:$PWD/node_modules/.bin
or call:
- bash scripts/ci-prehook.sh
