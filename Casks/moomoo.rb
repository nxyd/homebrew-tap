cask "moomoo" do
  version "16.39.27508"
  sha256 "0b40516142bb59230eec537aa73fc80ea88b46ce1cf005e7c9c73c1a7080ac95"

  url "https://softwaredownload.futustatic.com/moomoo_desktop_#{version}_Website.dmg"
  name "moomoo"
  desc "Desktop trading platform for stocks, options, ETFs, and other securities"
  homepage "https://www.moomoo.com/"

  livecheck do
    url "https://www.moomoo.com/download/mac", user_agent: :browser
    regex(/moomoo_desktop[._-]v?(\d+(?:\.\d+)+)_Website\.dmg/i)
    strategy :page_match
  end

  auto_updates true
  depends_on :macos

  app "moomoo.app"

  uninstall quit: "com.moomoo.mm-mac"

  zap trash: [
    "~/Library/Application Support/moomoo",
    "~/Library/Caches/moomoo",
    "~/Library/Containers/com.moomoo.mm-mac",
    "~/Library/HTTPStorages/com.moomoo.mm-mac",
    "~/Library/Preferences/com.moomoo.mm-mac.plist",
    "~/Library/Preferences/ZLZ7C4UZ87.com.moomoo.mm-mac.helper.renderer.plist",
    "~/Library/Saved Application State/com.moomoo.mm-mac.savedState",
  ]
end
