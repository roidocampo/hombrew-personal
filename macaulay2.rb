require 'formula'
require_relative 'lib/dmg'

M2_VERSION = '1.9.2'
MAC_VERSION = '10.11.6'
DMG_FILE = "Macaulay2-#{M2_VERSION}-x86_64-MacOS-#{MAC_VERSION}.dmg"

class Macaulay2 < Formula

    homepage 'http://www.math.uiuc.edu/Macaulay2'
    url "http://www.math.uiuc.edu/Macaulay2/Downloads/MacOSX/#{DMG_FILE}"
    sha256 "0f32a4712865b333a5267a64cacdfdec839e025ba48b8a05b3b93738ebae4d01"
    version M2_VERSION

    bottle do
        root_url 'https://raw.githubusercontent.com/roidocampo/homebrew-bottles/master'
        sha256 "6053fc4e3a5e16e9123b2c553a8aa40070d03489e4b7504913c152e0ba8edec0" => :el_capitan
    end

    def install
        extract_dmg DMG_FILE, buildpath/'dmg'
        (prefix/'Macaulay2').install Dir[buildpath/'dmg/Macaulay2-*/*']
        (bin/'M2').write script
    end

    def script; <<~EOS
        #!/bin/sh
        exec "#{prefix}/Macaulay2/bin/M2" "$@"
        EOS
    end

    test do
        system "false"
    end

end

