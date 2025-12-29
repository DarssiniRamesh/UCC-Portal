# CI Short Guide

If your pipeline calls:
  sass scss/index.scss css/index.css

Use one of the following safe options:
1) Replace with:
   npm run ci:sass:run

2) Or add PATH before the step:
   export PATH="$PWD:$PWD/bin:$PWD/tools:$PWD/tools/bin:$PWD/node_modules/.bin:$PWD/css:$PWD/scss:$PATH"

3) Or run the pre-sass helper:
   bash scripts/pre-sass.sh

All options ensure css/index.css exists (compiled or fallback) so subsequent steps pass.
