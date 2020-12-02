class Bl < Formula
  homepage "https://blocklayerhq.com"
  desc "Blocklayer CLI"

  version "20201201.1"
  version_scheme 1

  url "https://blocklayer-dev.s3.amazonaws.com/beta/cli/3773596b/bl-Darwin-x86_64"
  sha256 "b78b7f5ce5843f7860674d94c6acdb2ef88ed708a6303b4f12fcbd7ce4c8167b"

  def install
    mv "bl-Darwin-x86_64", "bl"
    bin.install "bl"
  end

  test do
    system "#{bin}/bl version"
  end
end
