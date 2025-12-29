# Replace hardcoded Sass step in CI

If your pipeline has a hardcoded step:
  sass scss/index.scss css/index.css

Replace it with:
  bash scripts/use-fallback-css.sh

Why this works:
- It compiles via npx sass when available (through scripts/build-css.sh), or
- Falls back to the committed css/index.fallback.css to ensure css/index.css exists.
- It never fails if Sass is not installed.
