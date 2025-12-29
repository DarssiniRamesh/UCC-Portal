# Replace Hardcoded Sass Step

Replace:
  sass scss/index.scss css/index.css

With:
  bash scripts/ci-bypass-sass.sh

Why:
- Ensures css/index.css is present by using the committed compiled CSS or the fallback.
- Avoids dependency on a global Sass binary in CI.
- Deterministic, no-op if css/index.css already exists.
