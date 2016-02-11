require 'formula'
# require_relative 'lib/dmg'

M2_VERSION = '1.7'
MAC_VERSION = '10.10'
DMG_FILE = "Macaulay2-#{M2_VERSION}-x86_64-MacOS-#{MAC_VERSION}.dmg"

class Macaulay2 < Formula

    homepage 'http://www.math.uiuc.edu/Macaulay2'
    url "http://www.math.uiuc.edu/Macaulay2/Downloads/MacOSX/#{DMG_FILE}"
    sha1 'e59de37158008de0f9440b306c9490e1bfd182e0'
    version M2_VERSION + ".2"

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

    class Dmg

        def initialize(dmg_path)
            @dmg_path = Pathname.new(dmg_path).realpath
            @dev = ''
            @volume = ''
        end

        def extract(destination_path)
            attach
            copy_data destination_path
        ensure
            detach
        end

        def attach
            cmd = %w[hdiutil attach -nobrowse -readonly -noidme -mountrandom /tmp]
            cmd.push(@dmg_path)
            IO.popen(cmd, "r") do |pipe|
                while line = pipe.gets
                    d,t,v = line.split(/\s+/, 3)
                    v = v.chomp
                    if t == "Apple_HFS" then
                        @dev = d
                        @volume = v
                    end
                end
            end
        end

        def detach
            system "hdiutil detach -quiet '#{@dev}'"
        end

        def copy_data(destination_path)
            system "ditto -- '#{@volume}' '#{destination_path}' >/dev/null 2>&1"
        end

    end

    def extract_dmg(dmg_path, destination_path)
        dmg_obj = Dmg.new dmg_path
        dmg_obj.extract(destination_path)
    end

end

