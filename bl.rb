class Bl < Formula
  homepage "https://blocklayerhq.com"
  desc "Blocklayer CLI"

  version "20210128.1"
  version_scheme 1

  url "https://blocklayer-dev.s3.amazonaws.com/beta/cli/b276feda/bl-Darwin-x86_64"
  sha256 "0b9b6000d0808db6cade83abfb3a1ff7e46b9bed3d56621683875a692558511e"

  def install
    mv "bl-Darwin-x86_64", "bl"
    bin.install "bl"
  end

  test do
    system "#{bin}/bl version"
  end
end
