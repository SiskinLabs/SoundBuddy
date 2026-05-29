# Run all S02 lint checks from repo root (PowerShell-safe; no &&).
$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

Write-Host "cargo fmt --check..."
cargo fmt --all -- --check
if (-not $?) { exit $LASTEXITCODE }

Write-Host "cargo clippy..."
cargo clippy --workspace --all-targets -- -D warnings
if (-not $?) { exit $LASTEXITCODE }

Write-Host "frontend lint..."
Set-Location (Join-Path $root "frontend")
npm run lint
if (-not $?) { exit $LASTEXITCODE }

Write-Host "All lint checks passed."
