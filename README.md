# Homebrew tap for Dictator

[Dictator](https://github.com/golovinengineer/canopen-dictator) is a CANopen
object dictionary editor: a desktop window, a terminal UI and a command line
in one app.

```sh
brew install --cask golovinengineer/tap/dictator
```

This installs `Dictator.app` into Applications and links its binary as
`dictator`, so `dictator --help`, the terminal UI and `dictator export` work
from a shell. `brew upgrade` picks up new releases; `brew uninstall --cask
dictator` removes both (add `--zap` to also delete the settings).

The app is not signed with an Apple Developer ID or notarized yet, and
Homebrew quarantines cask downloads, so macOS blocks the first start. Open
System Settings → Privacy & Security and click **Open Anyway**, or run
`xattr -dr com.apple.quarantine /Applications/Dictator.app` once.

The cask is updated automatically by Dictator's release workflow.
