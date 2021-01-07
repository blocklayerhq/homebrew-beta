class Bl < Formula
  homepage "https://blocklayerhq.com"
  desc "Blocklayer CLI"

  version "20210106.1"
  version_scheme 1

  url "https://blocklayer-dev.s3.amazonaws.com/beta/cli/4b1b8cc5/bl-Darwin-x86_64"
  sha256 "3f58428647269e484503f88d8c85e76bbd8a2264311ebd1b274a94d3ae57af78"

  def install
    mv "bl-Darwin-x86_64", "bl"
    bin.install "bl"
  end

  test do
    system "#{bin}/bl version"
  end
end
