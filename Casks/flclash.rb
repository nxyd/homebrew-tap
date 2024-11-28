cask "flclash" do
    version "0.8.68"
    sha256 "30f0717bf5f452fa640badba76eac48d06fc4cbfa8a5328ba5a7630b1fbd7ac7"

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
  
    uninstall quit: "com.follow.clash",
              delete: [
                "~/Library/LaunchAgents/com.follow.clash.plist",
              ]

    zap trash: [
      "~/Library/Application Support/FlClash",
      "~/Library/Caches/com.follow.clash",
      "~/Library/Logs/FlClash",
      "~/Library/Preferences/com.follow.clash.plist",
    ]
  end