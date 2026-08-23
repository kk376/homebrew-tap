class Ferrisfetch < Formula
  desc "Fast, lightweight Linux system information fetch CLI written in Rust"
  homepage "https://github.com/kk376/ferrisfetch"
  url "https://github.com/kk376/ferrisfetch/archive/refs/tags/v0.10.1.tar.gz"
  sha256 "c8fb41352601d607aed4b014552a69859d7021d2269f32d8f2531e42c26aa23a"
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

