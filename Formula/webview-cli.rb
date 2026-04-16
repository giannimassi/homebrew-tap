class WebviewCli < Formula
  desc "Native macOS UIs for CLI AI agents"
  homepage "https://github.com/giannimassi/webview-cli"
  url "https://github.com/giannimassi/webview-cli/archive/v0.1.1.tar.gz"
  sha256 "8d2f03e4c1f270857994d179f1ed29c00995e46f4f30d89bf27a125ccf28102b"
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
