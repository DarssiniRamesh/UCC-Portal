# After npm install

This project links a local `sass` executable to the robust builder at:
- node_modules/.bin/sass -> scripts/build-css.sh

Therefore, after:
- npm install --no-audit --no-fund

your CI can safely run:
- sass scss/index.scss css/index.css

and it will compile via npx sass (if available) or use the committed fallback css/index.fallback.css without failing.
