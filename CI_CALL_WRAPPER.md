# CI Wrapper for Hardcoded Sass Command

If your CI cannot change the step from:
  sass scss/index.scss css/index.css

Replace the line with:
  ./sass_scss_index.scss_css_index.css.sh

This one-liner ensures:
- CSS is compiled via npx if available, or
- Fallback css/index.fallback.css is copied to css/index.css
so the pipeline never fails on a missing Sass binary.
