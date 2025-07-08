class Fcpscene < Formula
  include Language::Python::Virtualenv

  desc "Final Cut Pro scene cut detector"
  homepage "https://github.com/ericfortis/final-cut-pro-scene-detect"
  url "https://github.com/ericfortis/final-cut-pro-scene-detect/archive/refs/tags/v1.3.1.tar.gz"
  sha256 "476c338fe3ac95dafd621d0f8df87a6cae079a65fe32c8df3ef9b185eb442b96"
  license "MIT"

  depends_on "python@3.13"
  depends_on "python-tk@3.13"
  depends_on "ffmpeg"

  def install
    virtualenv_install_with_resources
		system "make", "install", "DESTDIR=#{prefix}"
  end

  test do
    system "#{bin}/fcpscene", "--help"
  end

	def caveats
		<<~EOS
			fcpscene.app was saved to:
				#{opt_prefix}/fcpscene.app

			You can move it to your Applications folder.

			Otherwise, you can still use the CLI tool via:
				fcpscene --gui
		EOS
	end
end
