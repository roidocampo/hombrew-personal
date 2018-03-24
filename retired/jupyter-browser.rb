class JupyterBrowser < Formula
    desc "Viewer for Jupyter Notebooks based on nwjs.io"
    homepage "https://github.com/roidocampo/jupyter-browser"
    url "https://github.com/roidocampo/jupyter-browser/archive/v0.5.tar.gz"
    sha256 "80451f10a103ce56505871701dfd4da966b576eb70ac39798bcf8ce568a418e6"
    version "0.5"

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

        (prefix/"etc/jupyter").mkpath

        (prefix/"etc/jupyter/jupyter_notebook_config.py").write configfile

    end

    def configfile; <<-EOS.undent
        c = get_config()
        c.NotebookApp.browser = u'open -a "#{prefix}/JupyterBrowser.app" %s'
        EOS
    end

end
