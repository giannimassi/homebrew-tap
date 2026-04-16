class WebviewCli < Formula
  desc "Native macOS UIs for CLI AI agents"
  homepage "https://github.com/giannimassi/webview-cli"
  url "https://github.com/giannimassi/webview-cli/archive/v0.1.2.tar.gz"
  sha256 "d5a3b35e1cb5d207bb582c2c72bb7b7386e52dc519b9fcce264d945d5d2dbda4"
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
