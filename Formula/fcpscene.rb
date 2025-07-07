class Fcpscene < Formula
  include Language::Python::Virtualenv

  desc "Final Cut Pro scene cut detector"
  homepage "https://github.com/ericfortis/final-cut-pro-scene-detect"
  url "file:///Users/efortis/work/final-cut-pro-scene-detect-1.2.1.tar.gz"
  sha256 "57bdde0f3b98aa8506d2ae19fa380d4cf75a172526a6fd1ace9f3e9854970393"
  license "MIT"
  version "1.2.1"

  depends_on "python@3.13"
  depends_on "ffmpeg"

  def install
		virtualenv_install_with_resources
  end

  test do
    system "#{bin}/fcpscene", "--help"
  end
end
