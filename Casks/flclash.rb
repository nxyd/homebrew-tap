cask "flclash" do
    version "0.8.89"
    sha256 "7ff917a1e73ba2b3551cf4983d17236e6bff73f65f95748868463983fc9d40b4"

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
