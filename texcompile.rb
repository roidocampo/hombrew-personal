class Texcompile < Formula
    desc "Simple script for compilation of TeX/LaTeX files"
    homepage "https://github.com/roidocampo/texcompile"
    url "https://github.com/roidocampo/texcompile/archive/v0.5.tar.gz"
    sha256 "c0aefcbf6305c43a0fd8c989235a724ba08be22d17e1ad20ef347bed640a22f6"
    version "0.5"
    revision 1

    depends_on "python3"

    include Language::Python::Virtualenv

    def install
        virtualenv_install_with_resources
        man1.install "docs/texcompile.1"
    end
end
