# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Forteatoo < Formula
  desc "4ti2 -- A software package for algebraic, geometric and combinatorial problems on linear spaces."
  homepage "http://www.4ti2.de/"
  url "http://www.4ti2.de/version_1.6.6/4ti2-1.6.6.tar.gz"
  version "1.6.6"
  sha256 "2ae9f7dd6a387fd6f0454b4bc2d02cf389f504230cc9f782c35bb5ea4a8df10a"

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
