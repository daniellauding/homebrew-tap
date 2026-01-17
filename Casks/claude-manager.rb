cask "claude-manager" do
  version "1.4.1"
  sha256 "f450723d40d319a560b1870c8a6ba0d108a557daa9d2987f22cda5bdf3ab6b49"

  url "https://github.com/daniellauding/claude-manager/releases/download/v#{version}/ClaudeManager-v#{version}.zip"
  name "Claude Manager"
  desc "Menu bar app for managing Claude CLI instances"
  homepage "https://github.com/daniellauding/claude-manager"

  depends_on macos: ">= :ventura"

  app "ClaudeManager.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/ClaudeManager.app"],
                   sudo: false
  end

  zap trash: [
    "~/.claude/snippets.json",
  ]
end
