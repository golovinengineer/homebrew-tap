cask "dictator" do
  version "0.1.0"
  sha256 "2fe297df29303e59352a06d6463af5c6e43636966206efdc15bbaf32b6c4023c"

  url "https://github.com/golovinengineer/canopen-dictator/releases/download/v#{version}/Dictator-#{version}-macos-universal.zip"
  name "Dictator"
  desc "CANopen object dictionary editor"
  homepage "https://github.com/golovinengineer/canopen-dictator"

  # Git tags rather than GitHub releases: the releases strategy skips
  # pre-releases, and every release so far is one.
  livecheck do
    url :homepage
    regex(/^v?(\d+(?:\.\d+)+(?:-[\w.]+)?)$/i)
  end

  depends_on :macos

  app "Dictator.app"
  binary "#{appdir}/Dictator.app/Contents/MacOS/dictator"

  zap trash: [
    "~/Library/Application Support/dictator",
    "~/Library/Preferences/io.github.golovinengineer.dictator.plist",
    "~/Library/Saved Application State/io.github.golovinengineer.dictator.savedState",
  ]

  caveats <<~EOS
    Dictator is not signed with an Apple Developer ID or notarized yet, and
    Homebrew quarantines cask downloads, so macOS blocks the first start.
    Open System Settings > Privacy & Security and click "Open Anyway", or run:
      xattr -dr com.apple.quarantine #{appdir}/Dictator.app
  EOS
end
