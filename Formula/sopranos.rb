class Sopranos < Formula
  desc "Sopranos quotes in your terminal, with ASCII portraits"
  homepage "https://github.com/noahfinkelstein/tonysoprano"
  url "https://github.com/noahfinkelstein/tonysoprano/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "PUT_TARBALL_SHA256_HERE" # see README: fill in after tagging v1.0.0
  head "https://github.com/noahfinkelstein/tonysoprano.git", branch: "main"

  def install
    # keep script + data together in libexec; the script resolves the bin
    # symlink back here to find quotes.tsv and art/
    libexec.install "sopranos", "quotes.tsv", "art", "tools"
    bin.install_symlink libexec/"sopranos"
  end

  test do
    assert_match "Soprano", shell_output("#{bin}/sopranos -q -s tony")
  end
end
