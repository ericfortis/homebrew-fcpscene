class Fcpscene < Formula
  include Language::Python::Virtualenv

  desc "Final Cut Pro scene cut detector"
  homepage "https://github.com/ericfortis/final-cut-pro-scene-detect"
  url "https://github.com/ericfortis/final-cut-pro-scene-detect/archive/refs/tags/v1.6.0.tar.gz"
  sha256 "b81689c42ed5937d5518c5e8508ec35a96c85a5b4c2abc9709914b3bf250b528"
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

			Don’t use the `mv` command to install it.

			In Finder, Go -> Go to Folder, and type:
				#{opt_prefix}
			Then drag fcpscene.app to your Applications folder.

			Otherwise, you can still launch it from the terminal:
				fcpscene --gui
		EOS
	end
end
