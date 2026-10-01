cask "zshell" do
  arch arm: "arm64", intel: "x86_64"

  version "0.1.9"
  sha256 arm:   "bf4708d69b2fc69cc55310b4a5e590b3ed2abe44b206403e9600b80c4874b3e1",
         intel: "24d6177919bf2ef5b103839697e4921cfac35604662244727d19882f9d4e24e0"

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
