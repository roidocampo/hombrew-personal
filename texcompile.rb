class Texcompile < Formula
    desc "Simple script for compilation of TeX/LaTeX files"
    homepage "https://github.com/roidocampo/texcompile"
    url "https://github.com/roidocampo/texcompile/archive/v0.5.1.tar.gz"
    sha256 "155ee49fa20bf414ede1ec9c24473796b769cd4d8cb6c80e78e1ecfc2248655c"
    version "0.5.1"

    depends_on "python3"

    include Language::Python::Virtualenv

    def install
        virtualenv_install_with_resources
        man1.install "docs/texcompile.1"
    end
end
