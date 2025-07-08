class Fcpscene < Formula
  include Language::Python::Virtualenv

  desc "Final Cut Pro scene cut detector"
  homepage "https://github.com/ericfortis/final-cut-pro-scene-detect"
  url "https://github.com/ericfortis/final-cut-pro-scene-detect/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "2b2fb8664978f75132cd55948bd27f1268b4d4ca4038900c4175881ed1cd3429"
  license "MIT"

  depends_on "python@3.13"
  depends_on "python-tk@3.13"
  depends_on "ffmpeg"

  def install
    virtualenv_install_with_resources
    system "make", "install"
  end

  test do
    system "#{bin}/fcpscene", "--help"
  end
end
