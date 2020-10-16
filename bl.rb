class Bl < Formula
  homepage "https://blocklayerhq.com"
  desc "Blocklayer CLI"

  version "20201015.1"
  version_scheme 1

  url "https://blocklayer-dev.s3.amazonaws.com/beta/cli/ffbe1031/bl-Darwin-x86_64"
  sha256 "1c638b4e9073ddee074298ed7041ed70616a697bb02dcd518bad50ae1557c4ec"

  def install
    mv "bl-Darwin-x86_64", "bl"
    bin.install "bl"
  end

  test do
    system "#{bin}/bl version"
  end
end
