cask "clashx-meta" do
    version "1.4.13"
    sha256 "f8accc9ee183c4c643c5e02f4aec2fac837774c48c6fb3fec104ee3c46ab0346"
  
    url "https://github.com/MetaCubeX/ClashX.Meta/releases/download/v#{version}/ClashX.Meta.zip"
    name "ClashX Meta"
    desc "Rule-based custom proxy with GUI based on Clash.Meta"
    homepage "https://github.com/MetaCubeX/ClashX.Meta"
  
    auto_updates true
    livecheck do
      url :url
      strategy :github_latest
    end
  
    app "ClashX Meta.app"
  
    uninstall launchctl: "com.metacubex.ClashX.ProxyConfigHelper",
              quit:      "com.metacubex.ClashX",
              delete:    [
                "/Library/LaunchDaemons/com.metacubex.ClashX.ProxyConfigHelper.plist",
                "/Library/PrivilegedHelperTools/com.metacubex.ClashX.ProxyConfigHelper",
              ]
  
    zap trash: [
      "~/Library/Application Support/com.metacubex.ClashX.meta",
      "~/Library/Caches/com.metacubex.ClashX.meta",
      "~/Library/Logs/ClashX Meta",
      "~/Library/Preferences/com.metacubex.ClashX.meta.plist",
    ]
  end