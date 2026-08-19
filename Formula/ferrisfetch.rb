class Ferrisfetch < Formula
  desc "Fast, lightweight Linux system information fetch CLI written in Rust"
  homepage "https://github.com/kk376/ferrisfetch"
  url "https://github.com/kk376/ferrisfetch/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "dcfd5820278d131a82d9b7ae5e5ff0647b9bb9892c6c6bd910e1229932fd480f"
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
