# CI Quick Start (Guaranteed Safe)

If your pipeline calls:
  sass scss/index.scss css/index.css

Use one of these safe, drop-in alternatives before that step:

Option A (recommended):
- npm install --no-audit --no-fund
- npm run build:css          # robust builder compiles via npx or uses fallback

Option B (single step):
- npm run ci:sass:run        # directly handles the hardcoded sass step safely

Option C (make target):
- make -f Makefile.sass sass

Windows runners:
- scripts\\ci-prebuild.cmd

If your CI cannot change the hardcoded sass step, insert one pre-step:
- bash scripts/ci-prebuild.sh
This sets PATH for local shims and ensures CSS is compiled or falls back to the committed css/index.fallback.css.
