cask "zshell" do
  arch arm: "arm64", intel: "x86_64"

  version "0.1.10"
  sha256 arm:   "25752e184ab2f1ab5f3045cf03ce5a410237528f9a4628b1ac1969aefc3fd851",
         intel: "c72bc5fd229ec62504d009e010e2955899b50688419b04b0bbb742e8f4bbc49e"

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
