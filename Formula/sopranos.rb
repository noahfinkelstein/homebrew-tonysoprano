class Sopranos < Formula
  desc "Sopranos quotes in your terminal, with ASCII portraits"
  homepage "https://github.com/noahfinkelstein/homebrew-tonysoprano"
  url "https://github.com/noahfinkelstein/homebrew-tonysoprano/archive/refs/tags/v1.3.1.tar.gz"
  sha256 "d2ae225491a75aea49d0a5949eda5455a34c9887183dd3764860165476491317"
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
