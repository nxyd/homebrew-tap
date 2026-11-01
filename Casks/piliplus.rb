cask "piliplus" do
  version "2.2.0,5580,2.2.0"
  sha256 "89f1d78c141b6653292442c149cea0f5bb4cecdd1d8496418e26b3ebcb0eecbc"

  url "https://github.com/bggRGjQaUbCoE/PiliPlus/releases/download/#{version.csv.third}/PiliPlus_macos_#{version.csv.first}+#{version.csv.second}.dmg"
  name "PiliPlus"
  desc "Third-party BiliBili client built with Flutter"
  homepage "https://github.com/bggRGjQaUbCoE/PiliPlus"

  livecheck do
    url :url
    regex(/PiliPlus[._-]macos[._-]v?(\d+(?:\.\d+)+)(?:%2B|\+)(\d+)\.dmg/i)
    strategy :github_releases do |json, regex|
      json.flat_map do |release|
        next [] if release["draft"] || release["prerelease"]

        release["assets"].filter_map do |asset|
          match = asset["browser_download_url"].to_s.match(regex)
          next unless match

          "#{match[1]},#{match[2]},#{release["tag_name"]}"
        end
      end
    end
  end

  depends_on macos: :monterey

  app "PiliPlus.app"

  zap trash: [
    "~/Library/Application Support/com.example.piliplus",
    "~/Library/Caches/com.example.piliplus",
    "~/Library/Preferences/com.example.piliplus.plist",
    "~/Library/Saved Application State/com.example.piliplus.savedState",
  ]

  caveats <<~EOS
    PiliPlus is not signed with an Apple Developer ID or notarized.
    If macOS blocks it, allow it under System Settings → Privacy & Security.
  EOS
end
