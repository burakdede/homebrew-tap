class Aisw < Formula
  desc "AI and coding agent account manager and account switcher"
  homepage "https://github.com/burakdede/aisw"
  version "0.3.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/burakdede/aisw/releases/download/v0.3.3/aisw-aarch64-apple-darwin"
      sha256 "2e7bb8f311c4b2a17b98dcf2c23618ea02d04b860e2a2d2304c3a00d820d266a"
    else
      url "https://github.com/burakdede/aisw/releases/download/v0.3.3/aisw-x86_64-apple-darwin"
      sha256 "16fb2ddd9f5afc5978d1162577d373b9f61093684132afa6a24080384495fc05"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/burakdede/aisw/releases/download/v0.3.3/aisw-aarch64-unknown-linux-gnu"
      sha256 "514e8282b933efd891e098d5a4a9f0e746b1061c950861168dfae3cf2bc56244"
    else
      url "https://github.com/burakdede/aisw/releases/download/v0.3.3/aisw-x86_64-unknown-linux-gnu"
      sha256 "a09d17cad38235eb2bc622cd8391a1954500a53b3becc9910df2537390a02aaf"
    end
  end

  def install
    bin.install Dir["aisw-*"].first => "aisw"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aisw --version")
  end
end
