cask "zshell" do
  arch arm: "arm64", intel: "x86_64"

  version "0.1.4"
  sha256 arm:   "c14595691ee517497d6416cbb364e44fd974efcd35bf20935a8cd9f0e6b79217",
         intel: "4ea72a3713a831cb5432be5e2c8c3420364fdb2fe61a2b0c24aeea15af49211e"

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
