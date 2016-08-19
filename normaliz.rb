require 'formula'

class Normaliz < Formula
    homepage 'http://www.home.uni-osnabrueck.de/wbruns/normaliz/'
    url 'http://www.home.uni-osnabrueck.de/wbruns/normaliz/Normaliz2.10.1/Normaliz2.10.1MacOs.zip'
    sha256 'bd36917e14248f296fff9661335309979a9744cc55cecb0e74fac09d418a3954'
    version '2.10.1'

    resource 'share' do
        url 'http://www.home.uni-osnabrueck.de/wbruns/normaliz/Normaliz2.10.1/Normaliz2.10.1.zip'
        sha256 '94524d4592334ea1b083f795f39ae008aa3bd565e316f55387759074b27793af'
    end

    def install
        (share/'normaliz'/'2.10.1').install resource('share')
        (share/'normaliz'/'2.10.1').install Dir['*']
        (bin/'normaliz').write script('normaliz')
        (bin/'nmzIntegrate').write script('nmzIntegrate')
    end

    def script(name); <<-EOS.undent
        #!/bin/sh
        exec "#{share}/normaliz/2.10.1/#{name}" "$@"
        EOS
    end

    test do
        system "false"
    end
end
