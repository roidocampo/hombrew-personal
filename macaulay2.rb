require 'formula'
require_relative 'lib/dmg'

M2_VERSION = '1.7'
MAC_VERSION = '10.10'
DMG_FILE = "Macaulay2-#{M2_VERSION}-x86_64-MacOS-#{MAC_VERSION}.dmg"

class Macaulay2 < Formula

    homepage 'http://www.math.uiuc.edu/Macaulay2'
    url "http://www.math.uiuc.edu/Macaulay2/Downloads/MacOSX/#{DMG_FILE}"
    sha1 'e59de37158008de0f9440b306c9490e1bfd182e0'
    version M2_VERSION

    bottle do
        root_url 'https://raw.githubusercontent.com/roidocampo/homebrew-bottles/master'
        sha256 "133690a66994e904bfc3d62539ccc1e9f48e44d665671e287e06fe689b0c24e7" => :yosemite
    end

    def install
        extract_dmg DMG_FILE, buildpath/'dmg'
        (prefix/'Macaulay2').install Dir[buildpath/'dmg/Macaulay2-*/*']
        (bin/'M2').write script
    end

    def script; <<-EOS.undent
        #!/bin/sh
        exec "#{prefix}/Macaulay2/bin/M2" "$@"
        EOS
    end

    test do
        system "false"
    end

end

