cask "zshell" do
  version "0.1.0"
  sha256 "c691c49efbb3de994458c5218141630c71161bac8a86e0372a58af4b5e265d6a"

  url "https://github.com/wzz6423/zshell/releases/download/v#{version}/zshell-#{version}.dmg"
  name "Zshell"
  desc "Native terminal workspace with projects, panes, editor, and Git tools"
  homepage "https://wzz6423.github.io/zshell/"

  livecheck do
    url "https://github.com/wzz6423/zshell/releases/download/updates/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sequoia

  app "zshell.app"

  zap trash: [
    "~/.config/zshell",
    "~/Library/Caches/sh.zshell",
    "~/Library/Preferences/sh.zshell.plist",
    "~/Library/Saved Application State/sh.zshell.savedState",
  ]

  caveats <<~EOS
    Zshell requires macOS 15.6 or later.

    Zshell ships with an ad-hoc signature and is not notarized. If macOS blocks
    the first launch, open System Settings > Privacy & Security and choose
    "Open Anyway" after trying to open Zshell.
  EOS
end
