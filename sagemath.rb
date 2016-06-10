class Sagemath < Formula

    desc "Open Source Mathematics Software, free alternative to Magma, Maple, Mathematica, and Matlab"
    homepage "http://www.sagemath.org"
    url "https://github.com/githubtraining/hellogitworld/archive/RELEASE_1.0.tar.gz"
    sha256 "76e3d0ac5f5b9043c42e26785005b4a1a6699131a94789c990f006439120001f"
    version "7.2"

    resource "sourcetar" do
        url "http://mirrors.xmission.com/sage/osx/intel/sage-7.2-OSX_10.11.4-x86_64.tar.bz2"
        sha256 "76a91202fef7fbba9725d914e72118eede4c29ef9d925d18c9d0cf185a5becda"
        version "7.2"
    end

    def install
        cd prefix do
            resources.each do |r|
                r.verify_download_integrity(r.fetch)
                system "tar", "xvf", r.cached_download
            end
        end
        cd prefix/"SageMath" do
            system "python", "relocate-once.py"
        end
        (bin/'sage').write script
        jupyter_share = share/'jupyter'
        jupyter_orig = prefix/"SageMath/local/share/jupyter"
        (jupyter_share/'kernels').mkpath
        (jupyter_share/'nbextensions').mkpath
        (jupyter_share/'kernels').install_symlink (jupyter_orig/"kernels/sagemath")
        (jupyter_share/'nbextensions').install_symlink (jupyter_orig/"nbextensions/jsmol")
        (jupyter_share/'nbextensions').install_symlink (jupyter_orig/"nbextensions/mathjax")
    end

    def script; <<-EOS.undent
        #!/bin/sh
        export SAGE_ROOT="#{prefix}/SageMath"
        exec "#{prefix}/SageMath/sage" "$@"
        EOS
    end

end
