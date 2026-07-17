class Aisw < Formula
  desc "AI and coding agent account manager and account switcher"
  homepage "https://github.com/burakdede/aisw"
  version "0.3.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/burakdede/aisw/releases/download/v0.3.8/aisw-aarch64-apple-darwin"
      sha256 "796e2a4ee4e4809208adf3adebc53058aeadf49e402f69efba69d7225ee352ff"
    else
      url "https://github.com/burakdede/aisw/releases/download/v0.3.8/aisw-x86_64-apple-darwin"
      sha256 "05dc594acf6a58caacb9105e3069982c57fe131ac6828145394ac560edc081ac"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/burakdede/aisw/releases/download/v0.3.8/aisw-aarch64-unknown-linux-gnu"
      sha256 "c6358ca6ed5826f3921f968029028d22c14bec8fc554e564058870813d63d526"
    else
      url "https://github.com/burakdede/aisw/releases/download/v0.3.8/aisw-x86_64-unknown-linux-gnu"
      sha256 "4c791e969fb713db334ea6df649f13393df97e4b9950ecb401f25a9062eb4440"
    end
  end

  def install
    bin.install Dir["aisw-*"].first => "aisw"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aisw --version")
  end
end
