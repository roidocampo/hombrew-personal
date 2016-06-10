class JupyterCasKernels < Formula

    desc "Some kernels for jupyter"
    homepage "https://github.com/roidocampo/jupyter-cas-kernels"
    url "https://github.com/roidocampo/jupyter-cas-kernels/archive/v0.1.tar.gz"
    sha256 "c61905ae82dec7cde0534f71f996b954f4d90f70bc23116008aa6fd5529134c8"
    version "0.1-rev1"

    def install
        system "make", "install", "PREFIX=#{prefix}"
    end
end
