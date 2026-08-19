class Ferrisfetch < Formula
  desc "Fast, lightweight Linux system information fetch CLI written in Rust"
  homepage "https://github.com/kk376/ferrisfetch"
  url "https://github.com/kk376/ferrisfetch/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "8e28cf1527989920ba88ad3ce57982adc3b756cce49fc32976eb4e90cd90515b"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    bash_completion.install "completions/ferrisfetch.bash" => "ferrisfetch"
    zsh_completion.install "completions/_ferrisfetch"
    fish_completion.install "completions/ferrisfetch.fish"
  end

  test do
    assert_match "ferrisfetch", shell_output("#{bin}/ferrisfetch --version")
  end
end
