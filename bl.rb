class Bl < Formula
  homepage "https://blocklayerhq.com"
  desc "Blocklayer CLI"

  version "20201012.1"
  version_scheme 1

  url "https://blocklayer-dev.s3.amazonaws.com/beta/cli/2c57b256/bl-Darwin-x86_64"
  sha256 "ea55618d854ec583dde220f318c1e4eabe92674069f75049c39ea3c00affd0ca"

  def install
    mv "bl-Darwin-x86_64", "bl"
    bin.install "bl"
  end

  test do
    system "#{bin}/bl version"
  end
end
