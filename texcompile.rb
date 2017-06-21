class Texcompile < Formula
    desc "Simple script for compilation of TeX/LaTeX files"
    homepage "https://github.com/roidocampo/texcompile"
    url "https://github.com/roidocampo/texcompile/archive/v0.4.tar.gz"
    sha256 "2acc8698bc48a7ccd60ec7e272e3d1b818624c7aac91c17b1106ac84b8df5859"
    version "0.4"

    depends_on "python3"

    def install
        system "make", "install", "PREFIX=#{prefix}"
    end
end
