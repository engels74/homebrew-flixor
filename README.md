# homebrew-flixor

Homebrew tap for [Flixor](https://github.com/Flixorui/flixor) — a cross-platform Plex media client with a Netflix-like UI, built with SwiftUI.

## Install

```bash
brew tap engels74/flixor
brew install --cask flixor
```

Or as a one-liner:

```bash
brew install --cask engels74/flixor/flixor
```

## Update

```bash
brew upgrade --cask flixor
```

## Uninstall

```bash
brew uninstall --cask flixor
brew untap engels74/flixor
```

To also remove application data:

```bash
brew uninstall --cask --zap flixor
```

## How It Works

A [GitHub Actions workflow](.github/workflows/update-cask.yml) runs every 6 hours to check for new upstream releases. When a new release is detected, the workflow downloads the `.dmg`, computes its SHA256 checksum, re-hosts it on this repository's [releases](https://github.com/engels74/homebrew-flixor/releases), and updates the cask automatically.

Versions match the upstream release tags (e.g., `beta2.4.0`).

---

This is an unofficial community-maintained tap, not affiliated with the Flixor developer(s). Licensed under [AGPL-3.0](LICENSE).
