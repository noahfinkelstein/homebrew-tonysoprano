class Sopranos < Formula
  desc "Sopranos quotes in your terminal, with ASCII portraits"
  homepage "https://github.com/noahfinkelstein/homebrew-tonysoprano"
  url "https://github.com/noahfinkelstein/homebrew-tonysoprano/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "23217d0beaae5dab3d6378132f0f21c66548602931eeec9d9b95ecc3920c5cd0"
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
