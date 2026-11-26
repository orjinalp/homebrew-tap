# release.yml üretir (orjinalp/clsw packaging/brew_formula.py); elle düzenleme.
class Clsw < Formula
  desc "Claude Code profilleri arasında hesap değiştirme, limit ve maliyet görüntüleme"
  homepage "https://github.com/orjinalp/clsw"
  version "1.3.1"

  on_macos do
    on_arm do
      url "https://github.com/orjinalp/clsw/releases/download/v1.3.1/clsw-macos-arm64.tar.gz"
      sha256 "4d3e8c563c0b93e79fd3dcc98b87e8ccb529ef0f1b540080af7b7af41b611fd3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/orjinalp/clsw/releases/download/v1.3.1/clsw-linux-x64.tar.gz"
      sha256 "a2e61f9188a4a8d1803fb17fa6e7bc106d641499bdbd02a48ba910a308736806"
    end
    on_arm do
      url "https://github.com/orjinalp/clsw/releases/download/v1.3.1/clsw-linux-arm64.tar.gz"
      sha256 "37c63976a7afcfa890bbc7aeb7ba61a0e0eb94df017e53dd8c5f0ea0f2e1ebbb"
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
