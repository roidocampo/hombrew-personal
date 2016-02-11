# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/homebrew/master/frames
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class SurfAlggeo < Formula
  desc "Surf -- Visualization of real algebraic geometry"
  homepage "http://surf.sourceforge.net/"
  head "svn://svn.code.sf.net/p/surf/code/trunk"#, "surf-code"
  version "1.1"

  depends_on "autoconf" => :build
  depends_on "autogen" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  # depends_on "ntl" => :build
  # depends_on "flint" => :build
  # depends_on "mpfr" => :build
  # depends_on "homebrew/science/glpk" => :build
  # depends_on "homebrew/science/cddlib" => :build
  # depends_on "graphviz"

  # depends_on "pkg-config" => :build
  # depends_on "gtkmm" => :build
  depends_on "flex" => :build

  # depends_on :x11

  depends_on "gmp" => :build
  depends_on "gts" => :build
  depends_on "jpeg" => :build
  depends_on "libtiff" => :build
  depends_on "libpng" => :build
  depends_on "readline" => :build

  def install
    cd("surf") do
        inreplace "configure.ac" do |s|
            s.gsub! /^.*AM_PATH_GLIB.*$/, "# removed for homebrew formula"
        end
        system "./autogen.sh"
        system "./configure", "--prefix=#{prefix}"
        system "make"
        system "make", "install"
    end
  end

  test do
    system "false"
  end
end
