# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

A Homebrew tap (`engels74/flixor`) that distributes the [Flixor](https://github.com/Flixorui/flixor) macOS Plex client as a cask. The cask is **fully automated** — a CI workflow handles version updates, so manual edits to version/sha256 lines are rarely needed.

## Repository Structure

- `Casks/flixor.rb` — The Homebrew cask definition. Version and SHA256 are auto-updated by CI. The DMG is re-hosted on this repo's GitHub Releases (rolling `latest` tag) rather than pointing to upstream directly.
- `.github/workflows/update-cask.yml` — Primary CI workflow. Runs every 6 hours (and on manual dispatch). Checks upstream `Flixorui/flixor` for new releases, downloads the DMG, computes SHA256, uploads to a rolling GitHub Release, updates the cask file, commits, and runs a VirusTotal scan.
- `.github/workflows/immortality.yml` — Monthly workflow that re-enables scheduled workflows to prevent GitHub from disabling them due to inactivity.
- `gh-workflow-immortality.sh` — Third-party script (MIT-licensed, from PhrozenByte) used by the immortality workflow. Requires a `PERSONAL_TOKEN` secret.
- `renovate.json` — Renovate config that automerges all GitHub Actions dependency updates (including major versions).

## Key Conventions

- **Do not manually edit `version` or `sha256` in `Casks/flixor.rb`** — these are managed by the `update-cask` workflow. The only reason to touch them manually is to reset to placeholder values for testing CI.
- Version strings match upstream release tags verbatim (e.g., `beta2.4.0`).
- The DMG download URL in the cask always points to `https://github.com/engels74/homebrew-flixor/releases/download/latest/Flixor.dmg` (the re-hosted rolling release), not upstream.
- The `update-cask` workflow has two jobs: `update` (download, re-host, update cask, commit) and `virustotal-scan` (runs only when an update occurred, appends scan results to release notes).

## Testing the Cask Locally

```bash
# Install from this tap
brew tap engels74/flixor
brew install --cask flixor

# Audit the cask definition
brew audit --cask flixor

# Check cask style
brew style --cask engels74/flixor/flixor
```

## CI Secrets Required

- `VT_API_KEY` — VirusTotal API key for the scan job in `update-cask.yml`.
- `PERSONAL_TOKEN` — GitHub PAT with workflow permissions, used by `immortality.yml` to re-enable scheduled workflows.
