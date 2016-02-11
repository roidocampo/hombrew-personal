# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/homebrew/master/frames
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Singular < Formula
  desc "Singular -- A Computer Algebra System for Polynomial Computations"
  homepage "http://www.singular.uni-kl.de/"
  url "http://www.mathematik.uni-kl.de/ftp/pub/Math/Singular/SOURCES/4-0-2/singular-4.0.2.tar.gz"
  version "4.0.2"
  sha256 "c105a2c8ace0b3c9189b782ed63660ce235407d0160907c2cafc2128d36d8cb7"

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
    system "./configure", "--enable-gfanlib",
                          "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
