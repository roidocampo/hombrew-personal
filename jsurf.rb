
class Jsurf < Formula
    desc "A Java based renderer for algebraic surfaces."
    homepage "https://imaginary.org/program/jsurf"
    url "https://github.com/IMAGINARY/jsurf/archive/v0.3.0.tar.gz"
    sha256 "95ed115430ff947eb392d3fd7a659991008168e9a44d8b3c6bd2e6d2e06e9666"

    depends_on "gradle" => :build
    depends_on :java => "1.7+"

    def install
        system "gradle", "installDist"
        prefix.install Dir[buildpath/'build/install/jsurf']
        (bin/'jsurf').write script
    end

    def script; <<-EOS.undent
        #!/bin/sh
        exec "#{prefix}/jsurf/bin/jsurf" "$@"
        EOS
    end

    test do
        system "false"
    end
end
