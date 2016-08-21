class Texcompile < Formula
    desc "Simple script for compilation of TeX/LaTeX files"
    homepage "https://github.com/roidocampo/texcompile"
    url "https://github.com/roidocampo/texcompile/archive/v0.3.tar.gz"
    sha256 "93244bf9a994481eddde07f56b981255c94fa56efddfda3200584672315f8d1e"
    version "0.3"

    depends_on "python3"

    def install
        system "make", "install", "PREFIX=#{prefix}"
    end
end
