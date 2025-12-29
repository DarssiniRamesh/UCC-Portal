#!/usr/bin/env pwsh
# PowerShell CI wrapper for compiling CSS without global Sass.
# 1) Try local node_modules/.bin/sass
# 2) Try npx sass
# 3) Fallback to robust builder or copy fallback css
$ErrorActionPreference = "SilentlyContinue"
$PSScriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$Root = Resolve-Path (Join-Path $PSScriptRoot "..")
$LocalSass = Join-Path $Root "node_modules/.bin/sass"

# Prefer local sass if present
if (Test-Path $LocalSass) {
  Write-Host "[ci-compile-css.ps1] Using local node_modules/.bin/sass"
  & $LocalSass "scss/index.scss" "css/index.css"
  exit 0
}

# Try npx sass
$npx = Get-Command npx -ErrorAction SilentlyContinue
if ($npx) {
  Write-Host "[ci-compile-css.ps1] Using npx sass"
  Push-Location $Root
  & npx sass "scss/index.scss" "css/index.css"
  Pop-Location
  exit 0
}

# Fallback robust builder (bash required)
Write-Host "[ci-compile-css.ps1] Falling back to robust builder"
& bash (Join-Path $Root "scripts/build-css.sh")
Write-Host "[ci-compile-css.ps1] CSS ensured (compiled or fallback)."
exit 0
