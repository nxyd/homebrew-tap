cask "pi-desktop" do
  version "0.22.0"

  on_arm do
    sha256 "0c676610f83b6e3871308ad617f9f3c459fc679e5e4e7ab4210f82b61eb8fcb9"

    url "https://github.com/vastsa/PI-Desktop/releases/download/v#{version}/PI-Desktop-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "b8b1cbc70f296f2306fba427668c90f86714f495e63235592d645d11c4fd61de"

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
