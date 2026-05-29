# Changelog

All notable changes to SoundBuddy are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- **S02 / M0 infra** — `rustfmt.toml`, `rust-toolchain.toml` (stable), workspace Clippy lints in root `Cargo.toml`
- **Angular ESLint** — `eslint.config.js`, `ng lint` target, `@angular-eslint` dev dependencies
- **CI** — GitHub Actions workflow (`.github/workflows/ci.yml`): `cargo fmt --check`, `cargo clippy`, frontend `lint` + `build`
- **`scripts/lint.ps1`** — PowerShell-safe local lint runner (fmt, clippy, frontend ESLint)
- Root **README** — prerequisites, project layout, build/run, lint, and CI instructions

### Changed

- **`.gitignore`** — Tauri `gen/`, env files, Rust/Windows artifacts, frontend coverage; `docs/` remains local-only
- **Workspace crates** — `edition = "2021"` and `[lints] workspace = true` on all members (aligned with `src-tauri`)
- **`src-tauri/Cargo.toml`** — `rust-version` bumped to `1.85.0`; workspace lints enabled
- **README.md** — expanded from one-liner to full contributor guide (replaces minimal S01 blurb)

### Technical notes

- Clippy: `all` warnings, `pedantic` allowed, `unsafe_code` forbidden at workspace level
- CI uses Node 22 and `ubuntu-latest` for Rust and frontend jobs
- `cargo fmt` may be blocked on some Windows machines by Application Control policies; CI still enforces format on Linux

## [0.1.0] - 2026-05-29

Initial project scaffold (implementation guide **S01** / milestone **M0**).

### Added

- **Tauri v2** desktop shell in `src-tauri/` with default main window, capabilities, and app icons
- **Angular 20** frontend in `frontend/` (standalone components, SCSS, routing)
- **Rust workspace** at repo root with crates:
  - `soundbuddy-core`
  - `soundbuddy-audio`
  - `soundbuddy-media`
  - `soundbuddy-volume`
  - `soundbuddy-presets`
- Root `.gitignore` for Rust `target/`, Node modules, Angular build output, and local IDE files
- `Cargo.lock` for reproducible Rust builds
- `frontend/package-lock.json` for reproducible npm installs
- npm scripts: `tauri:dev` and `tauri:build` (run from `frontend/`, invoke Tauri from `src-tauri/`)

### Changed

- **README.md** — project summary and pointer to specification docs

### Technical notes

- App version and product name: `0.1.0` / `SoundBuddy` (`src-tauri/tauri.conf.json`)
- Frontend dev server: `http://localhost:4200`
- Production web assets path: `frontend/dist/frontend`
- Bundle identifier: `com.tauri.dev` (placeholder until release packaging)

### Known limitations

- Crates are scaffolded only; not yet wired into the Tauri app
- Default Angular welcome UI; no SoundBuddy features implemented
- No automated CI yet

### Configuration note

Paths in `tauri.conf.json` are resolved differently by Tauri:

| Setting                                  | Path              | Relative to                               |
| ---------------------------------------- | ----------------- | ----------------------------------------- |
| `frontendDist`, `$schema`                | `../frontend/...` | `src-tauri/` (config file directory)      |
| `beforeDevCommand`, `beforeBuildCommand` | `./frontend`      | Repository root (shell working directory) |

[Unreleased]: https://github.com/SiskinLabs/SoundBuddy/compare/v0.1.0...HEAD
[0.1.0]: https://github.com/SiskinLabs/SoundBuddy/releases/tag/v0.1.0
