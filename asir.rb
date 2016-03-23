class Asir < Formula
    desc "Asir -- open source general computer algebra system"
    homepage "http://www.math.kobe-u.ac.jp/Asir/index.html"
    url "https://github.com/roidocampo/homebrew-personal/raw/master/tarballs/openxm-head-20160320.tar.gz"
    version "20160320"
    sha256 "7a94542eaf97084f059441e594b07cf8c3571191bf72fdb1e6512e623b27b925"

    bottle do
        root_url 'https://raw.githubusercontent.com/roidocampo/homebrew-bottles/master'
        sha256 "9eb71785f265c35042b1a98bab0caa3a45378cf24ab1a6163fa4fce79f977656" => :yosemite
    end

    depends_on "automake" => :build
    depends_on "autoconf" => :build
    depends_on "libtool" => :build
    depends_on :x11

    resource "gmp" do
        url "http://www.math.kobe-u.ac.jp/pub/OpenXM/misc/gmp-5.0.4.tar.bz2"
        sha256 "35d4aade3e4bdf0915c944599b10d23f108ffedf6c3188aeec52221c5cf9a06f"
    end

    resource "pari" do
        url "http://www.math.kobe-u.ac.jp/pub/OpenXM/misc/pari-2.0.21.beta.tgz"
        sha256 "c396bcff5460ee947c34548b6023b15409c2352cb3eaa512b9bfc0cea53ac6a9"
    end

    resource "gc" do
        url "http://www.hboehm.info/gc/gc_source/gc-7.2b.tar.gz"
        sha256 "a780e3bc7da992a8660543af1f666918c2855edb05a8efbfca46f41083090dd2"
    end

    def install
        cd("OpenXM_contrib2/asir2000") do

            libexec.mkdir
            (libexec/"lib").mkdir
            (libexec/"include").mkdir

            resource("gmp").stage do
		system "./configure", "--prefix=#{libexec}", "--enable-cxx"
                system "make", "install"
            end

            resource("pari").stage do
                system "./Configure", "--prefix=#{libexec}"
                system "make", "all"
                system "make", "install"
            end

            r = resource("gc")
            r.verify_download_integrity(r.fetch)
            cp r.cached_download, "gc-7.2b.tar.gz"

            system "autoreconf", "-fvi"
            system "./configure", "--prefix=#{libexec}", 
                                  "--with-pari",
                                  "--enable-plot", 
                                  "--with-distdir=."
            system "make"
            system "make", "install"

            bin.install_symlink libexec/"lib/asir/asir"
        end
    end


    test do
        system "false"
    end
end

