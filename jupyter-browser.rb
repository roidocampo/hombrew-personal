class JupyterBrowser < Formula
    desc "Viewer for Jupyter Notebooks based on nwjs.io"
    homepage "https://github.com/roidocampo/jupyter-browser"
    url "https://github.com/roidocampo/jupyter-browser/archive/v0.2.tar.gz"
    sha256 "57ad5d3cf0df2117536cf49fe430080135172245f8c0b12a3a788ab78cccb8e2"
    version "0.2"

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
