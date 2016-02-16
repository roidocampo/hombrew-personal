
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
        cmd.push(@dmg_path.to_s)
        Open3.popen2e(*cmd) do |proc_in, proc_out, x|
            proc_in.puts "Y\n"
            while line = proc_out.gets
                puts line
                d,t,v = line.split(/\s+/, 3)
                if t == "Apple_HFS" then
                    @dev = d
                    @volume = v.chomp
                end
            end
        end
        puts
        puts "HERE"
        puts @dev
        puts @volume
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

