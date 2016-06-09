class EvinceDjvu < Formula
  desc "GNOME document viewer"
  homepage "https://wiki.gnome.org/Apps/Evince"
  url "https://download.gnome.org/sources/evince/3.18/evince-3.18.2.tar.xz"
  sha256 "42ad6c7354d881a9ecab136ea84ff867acb942605bcfac48b6c12e1c2d8ecb17"

  bottle do
    root_url 'https://raw.githubusercontent.com/roidocampo/homebrew-bottles/master'
    revision 1
    #sha256 "cab429616b34418b5bc410634ee05751ba3f1ec9b9ae337b59780cf9cd08bf04" => :yosemite
    sha256 "62452f93ebb772169e6fcf7325057f14c1e09c3e7038bb6e43189a205d70873e" => :el_capitan
  end

  depends_on "pkg-config" => :build
  depends_on "intltool" => :build
  depends_on "itstool" => :build
  depends_on "poppler"
  depends_on "djvulibre"
  depends_on "libxml2" => "with-python"
  depends_on "gtk+3"
  depends_on "hicolor-icon-theme"
  depends_on "gnome-icon-theme"
  depends_on "libsecret"
  depends_on "libspectre"
  depends_on "gobject-introspection"
  depends_on :python if MacOS.version <= :snow_leopard

  conflicts_with "evince", :because => "evince is what we want"

  def install
    # forces use of gtk3-update-icon-cache instead of gtk-update-icon-cache. No bugreport should
    # be filed for this since it only occurs because Homebrew renames gtk+3's gtk-update-icon-cache
    # to gtk3-update-icon-cache in order to avoid a collision between gtk+ and gtk+3.
    inreplace "data/Makefile.in", "gtk-update-icon-cache", "gtk3-update-icon-cache"
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          "--disable-nautilus",
                          "--disable-schemas-compile",
                          "--enable-introspection",
                          "--disable-browser-plugin"
    ENV.append_path "PYTHONPATH", "#{Formula["libxml2"].opt_lib}/python2.7/site-packages"
    system "make", "install"
  end

  def post_install
    system "#{Formula["glib"].opt_bin}/glib-compile-schemas", "#{HOMEBREW_PREFIX}/share/glib-2.0/schemas"
    system "#{Formula["gtk+3"].opt_bin}/gtk3-update-icon-cache", "-f", "-t", "#{HOMEBREW_PREFIX}/share/icons/hicolor"
  end

  test do
    assert_match /#{version}/, shell_output("#{bin}/evince --version")
  end
end
