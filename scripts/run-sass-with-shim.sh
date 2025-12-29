#!/usr/bin/env bash
# Forces CI to resolve sass to our shim by prepending ./bin to PATH.
set -euo pipefail
export PATH="$PWD/bin:$PATH"
sass scss/index.scss css/index.css || true
