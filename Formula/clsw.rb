# release.yml üretir (orjinalp/clsw packaging/brew_formula.py); elle düzenleme.
class Clsw < Formula
  desc "Claude Code profilleri arasında hesap değiştirme, limit ve maliyet görüntüleme"
  homepage "https://github.com/orjinalp/clsw"
  version "1.1.0"

  on_macos do
    on_arm do
      url "https://github.com/orjinalp/clsw/releases/download/v1.1.0/clsw-macos-arm64.tar.gz"
      sha256 "e8ae4baf16821da4ca52717472d7c9c0f0c07484b5a01aa3de5d7e38678bb586"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/orjinalp/clsw/releases/download/v1.1.0/clsw-linux-x64.tar.gz"
      sha256 "a3fb56ccd4d1d3fcb449fac46617db69e83a1fd9eba68361381a72fef09ce6ea"
    end
    on_arm do
      url "https://github.com/orjinalp/clsw/releases/download/v1.1.0/clsw-linux-arm64.tar.gz"
      sha256 "6b9b4ad9254637eb21997db9a6d5cd1648bd4169685348708cfd10b0a2c7467f"
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
