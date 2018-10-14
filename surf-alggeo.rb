
class SurfAlggeo < Formula
  desc "Surf -- Visualization of real algebraic geometry"
  homepage "http://surf.sourceforge.net/"
  url "ftp://jim.mathematik.uni-kl.de/pub/Math/Singular/misc/surf-1.0.6-gcc6.tar.gz"
  sha256 "f5e4c78c4c9c8b70e7aee2471db4b006eed2e0bd4afc0c19e3801a42c2c0a370"
  version "1.0.6"

  depends_on "gcc@6" => :build
  depends_on "autoconf" => :build
  depends_on "autogen" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "flex" => :build
  depends_on :x11
  depends_on "gmp" => :build
  depends_on "gts" => :build
  depends_on "jpeg" => :build
  depends_on "libtiff" => :build
  depends_on "libpng" => :build
  depends_on "readline" => :build

  def install
    inreplace "image-formats/jpeg.cc" do |s|
        s.gsub! /true/, "TRUE"
    end
    ENV["CC"] = "gcc-6"
    ENV["CXX"] = "g++-6"
    system "./configure", "--prefix=#{prefix}", "--disable-gui"
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
