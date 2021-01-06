class Bl < Formula
  homepage "https://blocklayerhq.com"
  desc "Blocklayer CLI"

  version "20210105.1"
  version_scheme 1

  url "https://blocklayer-dev.s3.amazonaws.com/beta/cli/78cbd60a/bl-Darwin-x86_64"
  sha256 "461715c2e510bed45ba634e277beccea8c95d49c8bdd807a540338f90651308b"

  def install
    mv "bl-Darwin-x86_64", "bl"
    bin.install "bl"
  end

  test do
    system "#{bin}/bl version"
  end
end
