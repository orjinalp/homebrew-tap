# release.yml üretir (orjinalp/clsw packaging/brew_formula.py); elle düzenleme.
class Clsw < Formula
  desc "Claude Code profilleri arasında hesap değiştirme, limit ve maliyet görüntüleme"
  homepage "https://github.com/orjinalp/clsw"
  version "1.3.2"

  on_macos do
    on_arm do
      url "https://github.com/orjinalp/clsw/releases/download/v1.3.2/clsw-macos-arm64.tar.gz"
      sha256 "1f0d927b51ec97ed5339acc2e594f0e86177aa65c5c668d10dd16759fe31aec3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/orjinalp/clsw/releases/download/v1.3.2/clsw-linux-x64.tar.gz"
      sha256 "f835a8fd1127d7d2293d70c829c859acfa2768fb3f2ce3fa442d8eb653d682e1"
    end
    on_arm do
      url "https://github.com/orjinalp/clsw/releases/download/v1.3.2/clsw-linux-arm64.tar.gz"
      sha256 "3f8c53c5f803469a178033adace5bb29d4191434ab1c2456eca64edb9406aebd"
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
