# One-liner to fix CI when `sass` is missing

Add this line before your build step:

export PATH="$PWD:$PWD/bin:$PWD/node_modules/.bin:$PATH"

This makes the repo-provided sass wrappers available:
- bin/sass.sh (exact-name shim)
- scripts/build-css.sh (robust builder used by npm run build:css)

Your pipeline can keep calling:
- sass scss/index.scss css/index.css
and it will work without a global sass installation.
