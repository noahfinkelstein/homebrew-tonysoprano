class Sopranos < Formula
  desc "Sopranos quotes in your terminal, with ASCII portraits"
  homepage "https://github.com/noahfinkelstein/homebrew-tonysoprano"
  url "https://github.com/noahfinkelstein/homebrew-tonysoprano/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "1a9db904e0dd3272f21b594235e11a63616c809871c055362d549b008099245b"
  license "MIT"
  head "https://github.com/noahfinkelstein/homebrew-tonysoprano.git", branch: "main"

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
