class Bl < Formula
  homepage "https://blocklayerhq.com"
  desc "Blocklayer CLI"

  version "20210128.1"
  version_scheme 1

  url "https://blocklayer-dev.s3.amazonaws.com/beta/cli/89a2ee05/bl-Darwin-x86_64"
  sha256 "cccef8987796876561468cd45d15753122936ee2504323388eccbf264cbb88f5"

  def install
    mv "bl-Darwin-x86_64", "bl"
    bin.install "bl"
  end

  test do
    system "#{bin}/bl version"
  end
end
