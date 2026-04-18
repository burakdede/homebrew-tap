class Aisw < Formula
  desc "AI and coding agent account manager and account switcher"
  homepage "https://github.com/burakdede/aisw"
  version "0.3.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/burakdede/aisw/releases/download/v0.3.2/aisw-aarch64-apple-darwin"
      sha256 "64fece56d9e9502af1db9af5cd6a2fcd342e31a499d6c4093ad6a596b222f6ee"
    else
      url "https://github.com/burakdede/aisw/releases/download/v0.3.2/aisw-x86_64-apple-darwin"
      sha256 "00beabfeb17871f4ae91a51ebe4b0bfa6b56074ef74abd659fb6f96d5dcd999b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/burakdede/aisw/releases/download/v0.3.2/aisw-aarch64-unknown-linux-gnu"
      sha256 "28301f0e6571852adf653d22fe1d6fc937869af61f5d4d129edeab72b4cf489d"
    else
      url "https://github.com/burakdede/aisw/releases/download/v0.3.2/aisw-x86_64-unknown-linux-gnu"
      sha256 "c3ba17fcc925292fa3ddf0b0c9d69662db2df7ede2d4358542bba223d44fdbaa"
    end
  end

  def install
    bin.install Dir["aisw-*"].first => "aisw"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aisw --version")
  end
end
