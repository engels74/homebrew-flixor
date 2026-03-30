# This cask is auto-updated by the update-cask workflow.
# Do not edit the version or sha256 lines manually.
cask "flixor" do
  version "beta2.4.0"
  sha256 "2b87d3bc7f7313e45a4d32270fc82d824f10995230d72885124f102e58998b9a"

  url "https://github.com/engels74/homebrew-flixor/releases/download/latest/Flixor.dmg"
  name "Flixor"
  desc "Cross-platform Plex media client with a Netflix-like UI"
  homepage "https://github.com/Flixorui/flixor"

  depends_on macos: ">= :ventura"

  app "FlixorMac.app"

  zap trash: [
    "~/Library/Application Support/com.flixor.mac",
    "~/Library/Caches/com.flixor.mac",
    "~/Library/HTTPStorages/com.flixor.mac",
    "~/Library/Preferences/com.flixor.mac.plist",
    "~/Library/Saved Application State/com.flixor.mac.savedState",
    "~/Library/WebKit/com.flixor.mac",
  ]
end
