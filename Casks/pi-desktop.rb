cask "pi-desktop" do
  version "0.23.0"

  on_arm do
    sha256 "839c503362dd74833894337afbd1490db3fd6a2a57ced31069c67130c70be26f"

    url "https://github.com/vastsa/PI-Desktop/releases/download/v#{version}/PI-Desktop-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "aeeb6f4201dfdc4c715fd2ec357de9208454a5fe0fe805ae655c590b75b59c8d"

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
