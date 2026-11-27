# release.yml üretir (orjinalp/clsw packaging/brew_formula.py); elle düzenleme.
class Clsw < Formula
  desc "Claude Code profilleri arasında hesap değiştirme, limit ve maliyet görüntüleme"
  homepage "https://github.com/orjinalp/clsw"
  version "1.3.4"

  on_macos do
    on_arm do
      url "https://github.com/orjinalp/clsw/releases/download/v1.3.4/clsw-macos-arm64.tar.gz"
      sha256 "56f443aae9cfd24a57c9efb5c61d700c304ed349906e6a1cd6893b7e181d08a5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/orjinalp/clsw/releases/download/v1.3.4/clsw-linux-x64.tar.gz"
      sha256 "ef6544ad3a8d6587687f6030b091f91674988b58a790da816343fda6cc96a3c6"
    end
    on_arm do
      url "https://github.com/orjinalp/clsw/releases/download/v1.3.4/clsw-linux-arm64.tar.gz"
      sha256 "8ce3058f87fe8023193a68295104f1f46431c10c17caf9f1a2d1b8dd592a4d5b"
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
