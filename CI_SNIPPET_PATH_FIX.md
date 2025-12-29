# Minimal CI snippet to fix missing `sass` binary

Add these lines before the hardcoded Sass step:

- npm install --no-audit --no-fund
- bash scripts/export-path-node-bin.sh
- sass scss/index.scss css/index.css

Why this works:
- npm install installs the Sass binary into ./node_modules/.bin
- export-path-node-bin.sh prepends that directory to PATH
- The raw `sass` command now resolves to the local binary and succeeds
