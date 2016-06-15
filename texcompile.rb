class Texcompile < Formula
    desc "Simple script for compilation of TeX/LaTeX files"
    homepage "https://github.com/roidocampo/texcompile"
    url "https://github.com/roidocampo/texcompile/archive/v0.2.tar.gz"
    sha256 "a78571e6ccc2629a1c87210a088be7a6b22da8e6c0d0962f0c3c63ab0dbce1de"
    version "0.2"

    depends_on "python"

    def install
        system "make", "install", "PREFIX=#{prefix}"
    end
end
