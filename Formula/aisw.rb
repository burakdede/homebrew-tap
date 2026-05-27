class Aisw < Formula
  desc "AI and coding agent account manager and account switcher"
  homepage "https://github.com/burakdede/aisw"
  version "0.3.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/burakdede/aisw/releases/download/v0.3.5/aisw-aarch64-apple-darwin"
      sha256 "9fbc640fbe135e3c75d1ad9f7e781dc80e925fca35d016bf2c1747d5be5fd9c0"
    else
      url "https://github.com/burakdede/aisw/releases/download/v0.3.5/aisw-x86_64-apple-darwin"
      sha256 "9604a81b1dd71bd31f6d1aa8f5c154dd2f8bc33246e5bba7f83fcf443249d66d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/burakdede/aisw/releases/download/v0.3.5/aisw-aarch64-unknown-linux-gnu"
      sha256 "e391e806d7acf3ecd80f69f71808709ff41839f79e9fa00082f333d5501d4e36"
    else
      url "https://github.com/burakdede/aisw/releases/download/v0.3.5/aisw-x86_64-unknown-linux-gnu"
      sha256 "bab7b68d7b3e6165079ff0860d0afd4d89859f28dc055395090780e741bf30e4"
    end
  end

  def install
    bin.install Dir["aisw-*"].first => "aisw"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aisw --version")
  end
end
