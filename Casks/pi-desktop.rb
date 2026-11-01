cask "pi-desktop" do
  version "0.21.0"

  on_arm do
    sha256 "58bcbca5ccfce546ab725821bcd8f5a561cf1c2065f1bae4b180d33988053e16"

    url "https://github.com/vastsa/PI-Desktop/releases/download/v#{version}/PI-Desktop-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "1144476f6bc5f316faf513bbfc71ba1ef5c062c12dd316a85798cef76ff2f432"

    url "https://github.com/vastsa/PI-Desktop/releases/download/v#{version}/PI-Desktop-#{version}-x64.dmg"
  end

  name "PI-Desktop"
  desc "Modular desktop workspace for AI agents"
  homepage "https://github.com/vastsa/PI-Desktop"

  livecheck do
    url "https://github.com/vastsa/PI-Desktop/releases/latest"
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :monterey

  app "PI-Desktop.app"

  uninstall quit: "net.aiuo.pi-desktop"

  zap trash: [
    "~/.pi-desktop",
    "~/Library/Application Support/PI-Desktop",
    "~/Library/Caches/@pi-desktopdesktop-updater",
    "~/Library/Caches/net.aiuo.pi-desktop",
    "~/Library/HTTPStorages/net.aiuo.pi-desktop",
    "~/Library/Logs/PI-Desktop",
    "~/Library/Preferences/net.aiuo.pi-desktop.plist",
    "~/Library/Saved Application State/net.aiuo.pi-desktop.savedState",
  ]
end
