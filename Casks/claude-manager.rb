cask "claude-manager" do
  version "1.4.2"
  sha256 "1f742531d7a4399491d1218f2f4774706e83c6bbcebba80099eeb8d16482a922"

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
