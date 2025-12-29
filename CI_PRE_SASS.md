# CI Pre-Sass Step

If your pipeline runs this line and cannot change it:
  sass scss/index.scss css/index.css

Add the following step immediately before it:
  bash scripts/pre-sass.sh

This ensures:
- css/index.css exists (compiled or fallback)
- a local './sass' executable exists in the working directory that intercepts the hardcoded call and succeeds
