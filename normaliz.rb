require 'formula'

class Normaliz < Formula
    homepage 'http://www.home.uni-osnabrueck.de/wbruns/normaliz/'
    url 'http://www.home.uni-osnabrueck.de/wbruns/normaliz/Normaliz2.10.1/Normaliz2.10.1MacOs.zip'
    sha1 '829885a2fbd058356c51297d9bcc601c7795a2e6'
    version '2.10.1'

    resource 'share' do
        url 'http://www.home.uni-osnabrueck.de/wbruns/normaliz/Normaliz2.10.1/Normaliz2.10.1.zip'
        sha1 '4ca2da20b4887ae3ab9cbc453c784ccfb73879ce'
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
