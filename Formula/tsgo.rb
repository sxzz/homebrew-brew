class Tsgo < Formula
  desc "Staging repo for development of native port of TypeScript"
  homepage "https://github.com/microsoft/typescript-go"
  license "Apache-2.0"

  livecheck do
    url "https://github.com/sxzz/tsgo-releases/releases/latest"
    regex(/^build-(\d{4}-\d{2}-\d{2})$/i)
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sxzz/tsgo-releases/releases/latest/download/tsgo-darwin-arm64.tar.gz"
    end
    if Hardware::CPU.intel?
      url "https://github.com/sxzz/tsgo-releases/releases/latest/download/tsgo-darwin-amd64.tar.gz"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/sxzz/tsgo-releases/releases/latest/download/tsgo-linux-amd64.tar.gz"
      end
    end

    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/sxzz/tsgo-releases/releases/latest/download/tsgo-linux-arm64.tar.gz"
      end
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
