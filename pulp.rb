class Pulp < Formula
    desc "File viewer for MacOS (for pdf, ps, and djvu files)"
    homepage "https://github.com/roidocampo/pulp"
    url "https://github.com/roidocampo/pulp/archive/v0.2.tar.gz"
    sha256 "ccfbfe67bc85987398a788afab0b1f26d576d93983ced982f864076f1b4d1bd7"
    version "0.2"

    depends_on "evince-djvu"
    depends_on "python3"
    depends_on "pygobject3"

    resource "Unidecode" do
        url "https://pypi.python.org/packages/source/U/Unidecode/Unidecode-0.04.19.tar.gz"
        sha256 "51477646a9169469e37e791b13ae65fcc75b7f7f570d0d3e514d077805c02e1e"
    end

    def install
        system "make", "BUILD_DIR=#{prefix}"

        resource("Unidecode").stage do
            tmp_dir = buildpath/"unidecode_build"
            py_version = Language::Python.major_minor_version("python3")
            py_packages = tmp_dir/"lib/python#{py_version}/site-packages"
            uni_dir = py_packages/"unidecode"
            ENV.delete "PYTHONPATH"
            system "python3", *Language::Python.setup_install_args(tmp_dir)
            (prefix/"Pulp.app/Contents/Resources").install uni_dir
        end

    end
end
