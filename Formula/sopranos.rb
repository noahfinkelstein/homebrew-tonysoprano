class Sopranos < Formula
  desc "Sopranos quotes in your terminal, with ASCII portraits"
  homepage "https://github.com/noahfinkelstein/tonysoprano"
  url "https://github.com/noahfinkelstein/tonysoprano/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "f5236fca810d982c577e70dded719736d0b24bfc7288d2a031ab6d4daef6e8cf"
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
