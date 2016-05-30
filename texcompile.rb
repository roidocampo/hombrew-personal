class Texcompile < Formula
    desc "Simple script for compilation of TeX/LaTeX files"
    homepage "https://github.com/roidocampo/texcompile"
    url "https://github.com/roidocampo/texcompile/archive/v0.1.tar.gz"
    sha256 "f4356c99df9f8012162f9d678a4806fe67e0231e529012bdb3feca6e92e95c60"
    version "0.1"

    depends_on "python"

    def install
        system "make", "install", "PREFIX=#{prefix}"
    end
end
