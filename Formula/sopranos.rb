class Sopranos < Formula
  desc "Sopranos quotes in your terminal, with ASCII portraits"
  homepage "https://github.com/noahfinkelstein/homebrew-tonysoprano"
  url "https://github.com/noahfinkelstein/homebrew-tonysoprano/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "53bb0a17c93b7c7d54738ff2c430b9a31ad0c9e9f10434057f5a9e3a983a8102"
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
