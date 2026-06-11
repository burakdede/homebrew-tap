class Aisw < Formula
  desc "AI and coding agent account manager and account switcher"
  homepage "https://github.com/burakdede/aisw"
  version "0.3.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/burakdede/aisw/releases/download/v0.3.6/aisw-aarch64-apple-darwin"
      sha256 "b647d4534441799a50ea2a56622b68af62bbbe20e0f4082119209f7a07d5aae0"
    else
      url "https://github.com/burakdede/aisw/releases/download/v0.3.6/aisw-x86_64-apple-darwin"
      sha256 "99b741d01d62422a8e14e31dd72986ae9a9d12141dfc3e906cc6c651b85ce143"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/burakdede/aisw/releases/download/v0.3.6/aisw-aarch64-unknown-linux-gnu"
      sha256 "dfaa6fdb466cd8dd3b1aee09778b80d102ea9022aee14613e3787f588afc8a9a"
    else
      url "https://github.com/burakdede/aisw/releases/download/v0.3.6/aisw-x86_64-unknown-linux-gnu"
      sha256 "aed5b833ec923dc6d9a319dc2759c6f65a24d15ecf877457d21f5a458c9bec71"
    end
  end

  def install
    bin.install Dir["aisw-*"].first => "aisw"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aisw --version")
  end
end
