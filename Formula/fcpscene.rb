class Fcpscene < Formula
  include Language::Python::Virtualenv

  desc "Final Cut Pro scene cut detector"
  homepage "https://github.com/ericfortis/final-cut-pro-scene-detect"
  url "https://github.com/ericfortis/final-cut-pro-scene-detect/archive/refs/tags/v1.11.2.tar.gz"
  sha256 "a769baa8fcc58aec4c0189060d5579741bd68dbc84b962b964cb48c5748ffc63"
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
