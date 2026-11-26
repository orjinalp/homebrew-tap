# release.yml üretir (orjinalp/clsw packaging/brew_formula.py); elle düzenleme.
class Clsw < Formula
  desc "Claude Code profilleri arasında hesap değiştirme, limit ve maliyet görüntüleme"
  homepage "https://github.com/orjinalp/clsw"
  version "1.2.1"

  on_macos do
    on_arm do
      url "https://github.com/orjinalp/clsw/releases/download/v1.2.1/clsw-macos-arm64.tar.gz"
      sha256 "b08816ce3d919947a54edce536223cb7c707363a4f3fe26b0960faf590e72f52"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/orjinalp/clsw/releases/download/v1.2.1/clsw-linux-x64.tar.gz"
      sha256 "3caafedecd66a26072eb420d15a93a764ac1ad324ef42b362fdb7b98efacde12"
    end
    on_arm do
      url "https://github.com/orjinalp/clsw/releases/download/v1.2.1/clsw-linux-arm64.tar.gz"
      sha256 "78adfebb513e7828bf72b73cdf82fe4fa6eba32d5978a037b736783348e9430f"
    end
  end

  def install
    # Arşiv clsw/ klasörüdür (program + _internal/); Homebrew içine girip açar.
    libexec.install Dir["*"]
    bin.install_symlink libexec/"clsw"
    bin.install_symlink libexec/"clsw" => "claudeswap"
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/clsw version")
  end
end
