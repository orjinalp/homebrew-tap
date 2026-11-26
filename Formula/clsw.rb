# release.yml üretir (orjinalp/clsw packaging/brew_formula.py); elle düzenleme.
class Clsw < Formula
  desc "Claude Code profilleri arasında hesap değiştirme, limit ve maliyet görüntüleme"
  homepage "https://github.com/orjinalp/clsw"
  version "1.1.1"

  on_macos do
    on_arm do
      url "https://github.com/orjinalp/clsw/releases/download/v1.1.1/clsw-macos-arm64.tar.gz"
      sha256 "89cef7a43d7817bec1e251f36b6b44f30396ede90c802a377cb9db7f1b725405"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/orjinalp/clsw/releases/download/v1.1.1/clsw-linux-x64.tar.gz"
      sha256 "9f023d59f0cdf236af671c9e1cb3cdb198d7df244c140d15ad349cd38c908558"
    end
    on_arm do
      url "https://github.com/orjinalp/clsw/releases/download/v1.1.1/clsw-linux-arm64.tar.gz"
      sha256 "3936edcafb03c2cbbcf13f6dff1b655802a6aee2837d9c229ad6605fd0203c54"
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
