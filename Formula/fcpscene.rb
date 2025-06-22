class Fcpscene < Formula
  include Language::Python::Virtualenv

  desc "Final Cut Pro scene cut detector"
  homepage "https://github.com/ericfortis/final-cut-pro-scene-detect"
  url "https://github.com/ericfortis/final-cut-pro-scene-detect/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "63ab8d22da802d0f699d41c3c76902c4d980d064464d70152105815634ff1a0e"
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
