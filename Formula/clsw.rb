# release.yml üretir (orjinalp/clsw packaging/brew_formula.py); elle düzenleme.
class Clsw < Formula
  desc "Claude Code profilleri arasında hesap değiştirme, limit ve maliyet görüntüleme"
  homepage "https://github.com/orjinalp/clsw"
  version "1.2.2"

  on_macos do
    on_arm do
      url "https://github.com/orjinalp/clsw/releases/download/v1.2.2/clsw-macos-arm64.tar.gz"
      sha256 "43d039a87772eddd3973412cc85d687d873b291cf518a10e9ae84e6d80d76ad5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/orjinalp/clsw/releases/download/v1.2.2/clsw-linux-x64.tar.gz"
      sha256 "fc399829ab564a7b71539e8e489071ea8e93f5290ec6e98f610e5f1cfac1cb64"
    end
    on_arm do
      url "https://github.com/orjinalp/clsw/releases/download/v1.2.2/clsw-linux-arm64.tar.gz"
      sha256 "3143b73299b7fc4ebd24407b3513f25a42b71300ef7ceb2eb573eafd85e16630"
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
