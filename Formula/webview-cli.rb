class WebviewCli < Formula
  desc "Native macOS UIs for CLI AI agents"
  homepage "https://github.com/giannimassi/webview-cli"
  url "https://github.com/giannimassi/webview-cli/archive/v0.2.0.tar.gz"
  sha256 "8d508dc8a8412938596ee24fd78101c58dbffaca259b6f94e84c6673649bb584"
  license "MIT"
  head "https://github.com/giannimassi/webview-cli.git", branch: "main"

  depends_on :macos
  depends_on macos: :monterey
  depends_on xcode: ["14.0", :build]

  def install
    system "make", "build"
    bin.install "webview-cli"
  end

  test do
    output = shell_output("#{bin}/webview-cli --help 2>&1", 3)
    assert_match "Usage:", output
  end
end
