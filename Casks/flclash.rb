cask "flclash" do
    version "0.8.71"
    sha256 "6be95b013f77c7e7e2e214679ea7198ac0daf44bc51babbc20b4f03c68c1efa2"

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
