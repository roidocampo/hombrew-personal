class Sagemath < Formula

    desc "Open Source Mathematics Software, free alternative to Magma, Maple, Mathematica, and Matlab"
    homepage "http://www.sagemath.org"
    url "https://github.com/githubtraining/hellogitworld/archive/RELEASE_1.0.tar.gz"
    sha256 "76e3d0ac5f5b9043c42e26785005b4a1a6699131a94789c990f006439120001f"
    version "8.3"

    resource "sourcetar" do
        url "http://mirrors.xmission.com/sage/osx/intel/sage-8.3-OSX_10.11.6-x86_64.tar.bz2"
        sha256 "27c10e56d9bb2cd51496626f099e09ab3f26ccf499c510d33d1d5a038cf2c93b"
        version "8.3"
    end

    def install
        cd prefix do
            resources.each do |r|
                r.verify_download_integrity(r.fetch)
                system "tar", "xvf", r.cached_download
            end
        end
        inreplace prefix/"SageMath/sage" do |s|
            s.sub! /#SAGE_ROOT=.*/, "SAGE_ROOT=\"#{prefix}/SageMath\""
        end
        inreplace prefix/"SageMath/local/bin/sage" do |s|
            s.sub! /\n/, "\n\n#{sagebin_patch}\n"
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

    def script; <<~EOS
        #!/bin/sh
        unset PYTHONPATH
        export SAGE_ROOT="#{prefix}/SageMath"
        exec "#{prefix}/SageMath/sage" "$@"
        EOS
    end

    def sagebin_patch; <<~EOS
        unset PYTHONPATH

        if [ -z "$SAGE_ROOT" ];  then
            SAGE_ROOT="#{prefix}/SageMath"
            export SAGE_ROOT
        fi
        EOS
    end

end
