class Sopranos < Formula
  desc "Sopranos quotes in your terminal, with ASCII portraits"
  homepage "https://github.com/noahfinkelstein/homebrew-tonysoprano"
  url "https://github.com/noahfinkelstein/homebrew-tonysoprano/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "4b1666fecc833ab841786d18e3dec2d26c7ea6e9c272d7fb87ad39bdcba67f38"
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
