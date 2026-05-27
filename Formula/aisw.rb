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
    url "https://static.crates.io/crates/aisw/aisw-0.3.5.crate"
    sha256 "2d541f7372b222789a524eaae311150631ea35e042951a21238d0e78031f431e"

    depends_on "rust" => :build
  end

  def install
    if OS.linux?
      system "cargo", "install", "--locked", "--root", prefix, "--path", "."
    else
      bin.install Dir["aisw-*"].first => "aisw"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aisw --version")
  end
end
