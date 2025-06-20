class Fcpscene < Formula
  include Language::Python::Virtualenv

  desc "Final Cut Pro scene cut detector"
  homepage "https://github.com/ericfortis/final-cut-pro-scene-detect"
  url "https://github.com/ericfortis/final-cut-pro-scene-detect/archive/refs/tags/v1.0.6.tar.gz"
  sha256 "69f93d6614c848ffc0da1dbde91be9e37e57bd41febe2ebfbc489d0f46abe56f"
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
