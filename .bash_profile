# Ensure repo-local shims are available to CI shells that source login profiles
export PATH="$PWD:$PWD/bin:$PWD/tools:$PWD/tools/bin:$PWD/node_modules/.bin:$PWD/css:$PWD/scss:$PATH"
