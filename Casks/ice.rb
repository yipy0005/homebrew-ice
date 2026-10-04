cask "ice" do
  version "0.11.13-dev.2a"
  sha256 "81ac6332998d54f735139fff69e629473ad1c4b3e0879c60b90ce5996e28eb0e"

  url "https://github.com/yipy0005/Ice/releases/download/v#{version}-macos27/Ice-#{version}.zip"
  name "Ice"
  desc "Menu bar manager (unofficial fork build)"
  homepage "https://github.com/yipy0005/Ice"

  conflicts_with cask: "jordanbaird-ice"
  depends_on macos: :tahoe

  app "Ice.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Ice.app"]
  end

  zap trash: [
    "~/Library/Application Support/Ice",
    "~/Library/Caches/com.jordanbaird.Ice",
    "~/Library/Preferences/com.jordanbaird.Ice.plist",
  ]
end
