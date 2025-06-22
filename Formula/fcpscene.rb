class Fcpscene < Formula
  include Language::Python::Virtualenv

  desc "Final Cut Pro scene cut detector"
  homepage "https://github.com/ericfortis/final-cut-pro-scene-detect"
  url "https://github.com/ericfortis/final-cut-pro-scene-detect/archive/refs/tags/v1.0.8.tar.gz"
  sha256 "404ad6f7a72121d4ea06ece0b4a0a02236ecea0891c019067b3917f0a28dca0b"
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
