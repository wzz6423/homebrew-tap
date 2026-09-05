# wzz6423/homebrew-tap

Homebrew casks and formulae for my macOS projects. The repository is named
`homebrew-tap`, so Homebrew addresses it as `wzz6423/tap`.

```bash
brew tap wzz6423/tap
```

Tapping is optional: a fully qualified name such as `wzz6423/tap/zisla` taps the
repository on first use.

## Casks

| Cask | Install | Project |
| --- | --- | --- |
| `zisla` | `brew install --cask wzz6423/tap/zisla` | [wzz6423/zisla](https://github.com/wzz6423/zisla) — top-edge macOS workspace for media, files, system tools, and local AI activity |

`zisla` resolves its archive per chip, so Apple Silicon and Intel Macs download
only their own build. It also declares `auto_updates true`, because the app
updates itself through Sparkle: a plain `brew upgrade` leaves the installed app
alone, and `brew upgrade --cask zisla` hands the replacement back to Homebrew.
The cask tracks stable releases only — preview builds stay on GitHub Releases so
an upgrade never moves anyone onto a prerelease.

## Layout

- `Casks/` — casks for `.app` distributions
- `Formula/` — command-line formulae (none yet)

Each project owns its own recipe here: its release process rewrites the version
and checksums, verifies them, and mirrors the file into this repository, so a
recipe should never be edited by hand while a release is in flight. Report a
broken application to its own repository, and a broken recipe here.

## License

The recipes in this repository are [BSD 2-Clause](LICENSE). The applications
they install carry their own licenses.
