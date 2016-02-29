class Singular < Formula
    desc "Singular -- A Computer Algebra System for Polynomial Computations"
    homepage "http://www.singular.uni-kl.de/"
    url "https://github.com/Singular/Sources/archive/Release-4-0-3.tar.gz"
    version "4.0.3"
    sha256 "037ac188da97d46306bf300c56f80d3ea9fe216913388315aef2e6944882c30d"

    depends_on "autoconf" => :build
    depends_on "autogen" => :build
    depends_on "automake" => :build
    depends_on "libtool" => :build
    depends_on "readline" => :build
    depends_on "gmp" => :build
    depends_on "ntl" => :build
    depends_on "flint" => :build
    depends_on "mpfr" => :build
    depends_on "homebrew/science/glpk" => :build
    depends_on "homebrew/science/cddlib" => :build
    depends_on "graphviz"

    def install
        system "./autogen.sh"
        system "./configure", "--prefix=#{prefix}"
        system "make"
        system "make", "install"
    end

    test do
        system "false"
    end
end

# OLD HACK:

# require 'formula'
# require_relative 'lib/dmg'

# DMG_FILE = "Singular4-0-2_64.dmg"

# class Singular < Formula

#     desc "Singular -- A Computer Algebra System for Polynomial Computations"
#     homepage "http://www.singular.uni-kl.de/"
#     url "ftp://www.mathematik.uni-kl.de/pub/Math/Singular/UNIX/Singular4-0-2_64.dmg"
#     sha256 "587de535df29ffe492b5686d9ebb0e79a5d70176022a424e4223719a728e532d"
#     version "4.0.2"

#     def install
#         extract_dmg DMG_FILE, buildpath/'dmg'
#         prefix.install Dir[buildpath/'dmg/Singular.app']
#         (bin/'singular').write script
#     end

#     def script; <<-EOS.undent
#         #!/bin/sh
#         exec "#{prefix}/Singular.app/Contents/bin/SINGULAR.sh" "$@"
#         EOS
#     end

#     test do
#         system "false"
#     end

# end
