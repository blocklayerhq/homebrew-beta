class Bl < Formula
  homepage "https://blocklayerhq.com"
  desc "Blocklayer CLI"

  version "__BREW_VERSION__"
  version_scheme 1

  url "https://blocklayer-dev.s3.amazonaws.com/beta/cli/__BIN_VERSION__/bl-Darwin-x86_64"
  sha256 "__BIN_DIGEST__"

  def install
    mv "bl-Darwin-x86_64", "bl"
    bin.install "bl"
  end

  test do
    system "#{bin}/bl version"
  end
end
