cask "zshell" do
  arch arm: "arm64", intel: "x86_64"

  version "0.1.3"
  sha256 arm:   "3f06f41d8ce33fcf31a815f96c4fd598a2566738e0a7f525f7d2b81fdc96c88c",
         intel: "ed21885169512ac42d5cbd9c9ca213be8374fbdeaa5380954d86ac6f3b4c2910"

  url "https://github.com/wzz6423/zshell/releases/download/v#{version}/zshell-v#{version}-macOS-#{arch}.zip"
  name "Zshell"
  desc "Native terminal workspace with projects, panes, editor, and Git tools"
  homepage "https://wzz6423.github.io/zshell/"

  livecheck do
    url "https://github.com/wzz6423/zshell/releases/latest/download/appcast-#{arch}.xml"
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

    Zshell uses a stable self-signed certificate and is not notarized. If macOS
    blocks the first launch, open System Settings > Privacy & Security and choose
    "Open Anyway" after trying to open Zshell. Sparkle verifies subsequent updates.
  EOS
end
