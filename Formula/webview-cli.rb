class WebviewCli < Formula
  desc "Native macOS UIs for CLI AI agents"
  homepage "https://github.com/giannimassi/webview-cli"
  url "https://github.com/giannimassi/webview-cli/archive/v0.1.3.tar.gz"
  sha256 "9cb3dae872869355e8895bd6f596ddcbdaa29c21cbc15f8c612c93b5d8b2f521"
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
