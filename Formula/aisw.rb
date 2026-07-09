class Aisw < Formula
  desc "AI and coding agent account manager and account switcher"
  homepage "https://github.com/burakdede/aisw"
  version "0.3.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/burakdede/aisw/releases/download/v0.3.7/aisw-aarch64-apple-darwin"
      sha256 "1e5dd6faa21e4ccf33eb86e57c4deeedd49bca144b88bad48e138b1eccade9db"
    else
      url "https://github.com/burakdede/aisw/releases/download/v0.3.7/aisw-x86_64-apple-darwin"
      sha256 "1e812ec1110dfe6c5724e038a41a7f426f013bb2b82bcf587a1e752a8f002403"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/burakdede/aisw/releases/download/v0.3.7/aisw-aarch64-unknown-linux-gnu"
      sha256 "eb9efcef8ad5f3566ebf49971e5da331b27a54a55edd9777c3e4cbc1ddac6731"
    else
      url "https://github.com/burakdede/aisw/releases/download/v0.3.7/aisw-x86_64-unknown-linux-gnu"
      sha256 "743c4dcfd0ed012d59a6114edfd4fe05ce7bdf7cd34f90a88a07bba1e27dfa15"
    end
  end

  def install
    bin.install Dir["aisw-*"].first => "aisw"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aisw --version")
  end
end
