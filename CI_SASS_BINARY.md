# Ensuring `sass` binary availability in CI

This project installs Sass via npm devDependencies:
- sass (Dart Sass)
- sass-embedded (ensures a binary is available for environments requiring the embedded protocol)

After running:
- npm install --no-audit --no-fund

the `sass` binary is available at:
- ./node_modules/.bin/sass

If CI invokes `sass scss/index.scss css/index.css` directly, ensure PATH includes node_modules/.bin:
- export PATH="$PWD/node_modules/.bin:$PATH"
- sass scss/index.scss css/index.css

Alternatively, replace the step with:
- npm run build:css
