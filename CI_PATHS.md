# CI PATH mappings

Many CI templates prepend one or more of these paths to PATH, which this repo now supports with shims:
- ./bin            -> bin/sass (delegates to root ./sass -> scripts/build-css.sh)
- ./tools/bin      -> tools/bin/sass (delegates directly to scripts/build-css.sh)
- ./node_modules/.bin -> npm binary shim (bin/sass) created during npm install

If your CI invokes:
  sass scss/index.scss css/index.css
it will resolve to one of the above shims and either compile via npx sass or copy the precompiled css/index.fallback.css.
