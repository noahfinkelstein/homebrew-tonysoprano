class Sopranos < Formula
  desc "Sopranos quotes in your terminal, with ASCII portraits"
  homepage "https://github.com/noahfinkelstein/homebrew-sopranos"
  url "https://github.com/noahfinkelstein/homebrew-sopranos/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "b2e8b53d2778ad2062f3309633fe0f39f0bdf7b9359bdc1a68c5df80278a85cb"
  license "MIT"
  head "https://github.com/noahfinkelstein/homebrew-sopranos.git", branch: "main"

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
