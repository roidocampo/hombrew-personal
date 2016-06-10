class JupyterCasKernels < Formula

    desc "Some kernels for jupyter"
    homepage "https://github.com/roidocampo/jupyter-cas-kernels"
    url "https://github.com/roidocampo/jupyter-cas-kernels/archive/v0.2.tar.gz"
    sha256 "5dcf6795d74708efc650ef5016aac6a05a3579664cd3ce814dc14562c1d5dc02"
    version "0.2"

    def install
        system "make", "install", "PREFIX=#{prefix}"
    end
end
