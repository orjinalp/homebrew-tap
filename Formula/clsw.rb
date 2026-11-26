# release.yml üretir (orjinalp/clsw packaging/brew_formula.py); elle düzenleme.
class Clsw < Formula
  desc "Claude Code profilleri arasında hesap değiştirme, limit ve maliyet görüntüleme"
  homepage "https://github.com/orjinalp/clsw"
  version "1.3.0"

  on_macos do
    on_arm do
      url "https://github.com/orjinalp/clsw/releases/download/v1.3.0/clsw-macos-arm64.tar.gz"
      sha256 "6f11daf369db0e07c04ca928cf0df9c9de630a01f612ced0dd198eebf7af966d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/orjinalp/clsw/releases/download/v1.3.0/clsw-linux-x64.tar.gz"
      sha256 "917b85f2c7ae79212ab57a23f717df14dfa1bdbd1ed8eb25a4f89960713d02a6"
    end
    on_arm do
      url "https://github.com/orjinalp/clsw/releases/download/v1.3.0/clsw-linux-arm64.tar.gz"
      sha256 "e20703bff24eee93977dabaf7b92932cb38a6d3a7f0e706c2cb54ce861f90708"
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
