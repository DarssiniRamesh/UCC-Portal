SHELL := /bin/bash

.PHONY: all build css e2e

all: build

build: css
	@echo "[Makefile] Build completed."

css:
	@bash scripts/build-css.sh
	@echo "[Makefile] css/index.css ensured (compiled or fallback)."

e2e:
	@npm run cypress:run
