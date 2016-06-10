class JupyterBrowser < Formula
    desc "Viewer for Jupyter Notebooks based on nwjs.io"
    homepage "https://github.com/roidocampo/jupyter-browser"
    url "https://github.com/roidocampo/jupyter-browser/archive/v0.1.tar.gz"
    sha256 "892098052cb9fc8dbac48dd7170b97c0108da027f4d99169a61db29681258bea"
    version "0.1"

    resource "nwjs" do
        url "http://dl.nwjs.io/v0.15.2/nwjs-sdk-v0.15.2-osx-x64.zip"
        sha256 "548378e47ef30521d04c9daac0c6e5dfb87ff8491b153d4efa7045b901d06075"
    end

    def install

        mkdir "vendor" do
            resources.each do |r|
                r.verify_download_integrity(r.fetch)
                original_name = File.basename(r.url)
                cp r.cached_download, original_name
            end
        end

        system "make", "BUILD_DIR=#{prefix}"

    end
end
