class TeXCompile < Formula
    desc "Simple script for compilation of TeX/LaTeX files"
    homepage "https://github.com/roidocampo/texcompile"
    url "https://github.com/roidocampo/texcompile/archive/v0.1.tar.gz"
    sha256 "3d2dadf0db364e0ab4f1d3e99f4b3dfd8539490047725c0f58f6f6ab0c05da7c"
    version "0.1"

    depends_on "python"

    def install
        system "make", "install", "PREFIX=#{prefix}"
    end
end
