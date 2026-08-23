class Ferrisfetch < Formula
  desc "Fast, lightweight Linux system information fetch CLI written in Rust"
  homepage "https://github.com/kk376/ferrisfetch"
  url "https://github.com/kk376/ferrisfetch/archive/refs/tags/v0.9.9.tar.gz"
  sha256 "a40d5b13157bcbacef486ccafaf4f3e28e5e74a3b229be50aa3b8a7887893444"
  license "MIT"

  depends_on "rust" => :build

  def install
    # std_cargo_args expands to --root #{prefix} --path . isolating binaries to #{bin}
    system "cargo", "install", *std_cargo_args

    # Install shell completion definitions into standard Homebrew share paths
    bash_completion.install "completions/ferrisfetch.bash" => "ferrisfetch"
    zsh_completion.install "completions/_ferrisfetch"
    fish_completion.install "completions/ferrisfetch.fish"
  end

  test do
    # Execute the installed binary in a clean sandbox test directory to verify binary ELF linkage and exit code
    assert_match "ferrisfetch", shell_output("#{bin}/ferrisfetch --version")
  end
end

