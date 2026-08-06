class Sopranos < Formula
  desc "Sopranos quotes in your terminal, with ASCII portraits"
  homepage "https://github.com/noahfinkelstein/homebrew-sopranos"
  url "https://github.com/noahfinkelstein/homebrew-sopranos/archive/refs/tags/v2.1.0.tar.gz"
  sha256 "0f506073a236430e79b2b727b9611cf02de472e3d6609ee725593b184a229973"
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
