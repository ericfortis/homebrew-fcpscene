class Fcpscene < Formula
  include Language::Python::Virtualenv

  desc "Final Cut Pro scene cut detector"
  homepage "https://github.com/ericfortis/final-cut-pro-scene-detect"
  url "https://github.com/ericfortis/final-cut-pro-scene-detect/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "1ef7910531567c0a512becae6367b1325d5056ea8157e79cc0d43cb11dcfc861"
  license "MIT"

  depends_on "python@3.13"
  depends_on "ffmpeg"

  def install
    virtualenv_install_with_resources
    bin.install_symlink libexec/"bin/fcpscene" => "fcpscene"
    bin.install "bin/fcpscene-gui"
  end

  test do
    system "#{bin}/fcpscene", "--help"
    assert_predicate bin/"fcpscene-gui", :exist?
  end
end
