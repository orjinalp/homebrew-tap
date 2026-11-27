# release.yml üretir (orjinalp/clsw packaging/brew_formula.py); elle düzenleme.
class Clsw < Formula
  desc "Claude Code profilleri arasında hesap değiştirme, limit ve maliyet görüntüleme"
  homepage "https://github.com/orjinalp/clsw"
  version "1.3.3"

  on_macos do
    on_arm do
      url "https://github.com/orjinalp/clsw/releases/download/v1.3.3/clsw-macos-arm64.tar.gz"
      sha256 "445f937c1b368a208263ad96e98e424f91c26430a80b037e3aeb49f76f9e4f22"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/orjinalp/clsw/releases/download/v1.3.3/clsw-linux-x64.tar.gz"
      sha256 "b65698f9e0b152c926ccc06f8b75e8e631a6895e662c30438055fbc33187b125"
    end
    on_arm do
      url "https://github.com/orjinalp/clsw/releases/download/v1.3.3/clsw-linux-arm64.tar.gz"
      sha256 "4e6cc534b89d6d0c9b8aa49231aee1fa3822bf8a9387b1bc7651e96bab370255"
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
