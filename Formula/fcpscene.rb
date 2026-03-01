class Fcpscene < Formula
  include Language::Python::Virtualenv

  desc "Final Cut Pro scene cut detector"
  homepage "https://github.com/ericfortis/final-cut-pro-scene-detect"
  url "https://github.com/ericfortis/final-cut-pro-scene-detect/archive/refs/tags/v1.9.3.tar.gz"
  sha256 "8d61a6fd14ec1d750a39381e8a2bc00d8a0ccb9193ed6e9775f141f1f451cbb8"
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
				#{opt_prefix}

			In Finder, Go -> Go to Folder
				#{opt_prefix}

			Then drag fcpscene.app to your Applications folder.

			Otherwise, you can launch it from the terminal:
				fcpscene --gui
		EOS
	end
end
