# CI Environment Setup

To ensure builds do not depend on a globally installed `sass`, configure PATH to include local shims:

Option A (recommended):
- source ./.envrc
- OR export PATH="$PWD:$PWD/node_modules/.bin:$PWD/tools:$PATH"

Then the following will work:
- sass scss/index.scss css/index.css
- npm run build:css
- bash scripts/build-css.sh

If `sass` is still invoked before npm install, our wrappers will fall back to css/index.fallback.css to allow the build to proceed.
