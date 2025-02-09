cask "flclash" do
    version "0.8.75"
    sha256 "f14927216d8314e879df4b8c173427b08c66eee3ac9af57b4b8861cb635decde"

    url "https://github.com/chen08209/FlClash/releases/download/v#{version}/FlClash-#{version}-macos-arm64.dmg"
    name "Flclash"
    desc "A multi-platform proxy client based on ClashMeta."
    homepage "https://github.com/chen08209/FlClash"

    auto_updates true
    livecheck do
      url :url
      strategy :github_latest
    end
  
    app "FlClash.app"
  
    uninstall quit: "com.follow.clash"

    zap trash: [
      "~/Library/Application Support/com.follow.clash",
      "~/Library/Caches/com.follow.clash",
      "~/Library/Logs/FlClash",
      "~/Library/Preferences/com.follow.clash.plist"
    ]
  end
