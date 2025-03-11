class Tsgo < Formula
  desc "Staging repo for development of native port of TypeScript"
  homepage "https://github.com/microsoft/typescript-go"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/sxzz/tsgo-releases/releases/latest/download/tsgo-macos-arm64.tar.gz"
    end
    on_intel do
      url "https://github.com/sxzz/tsgo-releases/releases/latest/download/tsgo-macos-amd64.tar.gz"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sxzz/tsgo-releases/releases/latest/download/tsgo-linux-amd64.tar.gz"
    end
  end

  def install
    libexec.install Dir["*"]
    chmod 0755, libexec/"tsgo"
    bin.install_symlink libexec/"tsgo"
  end

  test do
    system bin/"tsgo", "-h"
  end
end
