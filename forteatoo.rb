class Forteatoo < Formula
    desc "4ti2 -- A software package for algebraic, geometric and combinatorial problems on linear spaces."
    homepage "http://www.4ti2.de/"
    url "http://www.4ti2.de/version_1.6.6/4ti2-1.6.6.tar.gz"
    version "1.6.6"
    sha256 "2ae9f7dd6a387fd6f0454b4bc2d02cf389f504230cc9f782c35bb5ea4a8df10a"

    bottle do
        root_url 'https://raw.githubusercontent.com/roidocampo/homebrew-bottles/master'
        cellar :any
        rebuild 1
        sha256 "88aec0f40f01a0f69588c7fbbe7374c99419b566a54df48944fceb3348447457" => :el_capitan
        sha256 "1e05c6691320d37db870ef389a274ba7b65456e3761b0de334905af38239367c" => :yosemite
    end

    depends_on 'gmp' => :build
    depends_on 'homebrew/science/glpk' => :build

    def install
        system "./configure", "--prefix=#{prefix}"
        system "make"
        system "make", "install"
    end

    test do
        system "false"
    end
end
