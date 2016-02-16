
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

