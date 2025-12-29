# Last Resort CI Instruction

If your CI cannot modify PATH, npm scripts, or build steps and still invokes:
  sass scss/index.scss css/index.css

Add a single preparatory step to call the robust builder directly:
  bash scripts/build-css.sh

This compiles via npx sass when available or safely falls back to css/index.fallback.css.
