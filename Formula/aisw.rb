class Aisw < Formula
  desc "AI and coding agent account manager and account switcher"
  homepage "https://github.com/burakdede/aisw"
  version "0.3.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/burakdede/aisw/releases/download/v0.3.4/aisw-aarch64-apple-darwin"
      sha256 "b57f9d356019056b59d074b4ce08fa0cbf2eb78d5bfb28ca19e7e9d49c87946d"
    else
      url "https://github.com/burakdede/aisw/releases/download/v0.3.4/aisw-x86_64-apple-darwin"
      sha256 "aac9b446937dbd0cd010344a42619d096cc3a915c9c08e329a215a0d4838aa1f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/burakdede/aisw/releases/download/v0.3.4/aisw-aarch64-unknown-linux-gnu"
      sha256 "6cc7062deb09697f5e093bec60ee67c451bc24887e19f5cacfa9327064726f6d"
    else
      url "https://github.com/burakdede/aisw/releases/download/v0.3.4/aisw-x86_64-unknown-linux-gnu"
      sha256 "ad9f2bdc309c8ad7ce3cf5475eed911d96f3999798d54a45214054eaa8c26c89"
    end
  end

  def install
    bin.install Dir["aisw-*"].first => "aisw"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aisw --version")
  end
end
