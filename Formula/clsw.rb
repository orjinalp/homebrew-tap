# release.yml üretir (orjinalp/clsw packaging/brew_formula.py); elle düzenleme.
class Clsw < Formula
  desc "Claude Code profilleri arasında hesap değiştirme, limit ve maliyet görüntüleme"
  homepage "https://github.com/orjinalp/clsw"
  version "1.2.0"

  on_macos do
    on_arm do
      url "https://github.com/orjinalp/clsw/releases/download/v1.2.0/clsw-macos-arm64.tar.gz"
      sha256 "357557929e02fbcee669efe1f2b65f2fad5716a6c8f4ed061a962bd1785f8b55"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/orjinalp/clsw/releases/download/v1.2.0/clsw-linux-x64.tar.gz"
      sha256 "f55a903063f0f885a9cc8692dc5b2178121e6b725579188e0d92287c5f8c3524"
    end
    on_arm do
      url "https://github.com/orjinalp/clsw/releases/download/v1.2.0/clsw-linux-arm64.tar.gz"
      sha256 "81f3349d2140ced5a932581ea6edfe3cb732ba6d6457092ee34860063ab594b0"
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
