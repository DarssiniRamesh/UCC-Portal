# One-liner for CI to replace the hard-coded `sass` step

Replace:
  sass scss/index.scss css/index.css

With:
  npm run ci:sass:run

This uses the hermetic Node shim (sass.js) or the robust builder (scripts/build-css.sh) to ensure CSS is present without relying on a global Sass installation.
