class Pulp < Formula
    desc "File viewer for MacOS (for pdf, ps, and djvu files)"
    homepage "https://github.com/roidocampo/pulp"
    url "https://github.com/roidocampo/pulp/archive/v0.8.tar.gz"
    sha256 "b85308c4239bcd427dfbb35e9dc766363e4ed9efe83e5aaf74f3185135c27866"
    version "0.8"

    depends_on "python3"
    depends_on "py3cairo"
    depends_on "evince"
    depends_on "pygobject3" => "with-python3"
    depends_on "gtk-mac-integration"

    resource "Unidecode" do
        url "https://pypi.python.org/packages/source/U/Unidecode/Unidecode-0.04.19.tar.gz"
        sha256 "51477646a9169469e37e791b13ae65fcc75b7f7f570d0d3e514d077805c02e1e"
    end

    resource "PyObjC-Core" do
        url "https://pypi.python.org/packages/7e/03/303a5c7f7c3d3af811eba44b32ef957e570be4d5c5b656c0b44ece6191e0/pyobjc-core-3.2.1.tar.gz"
        sha256 "848163845921e5a61e069ea42bab06ac73278f5a09b4e9cedd6a3eac6712ff2c"
    end

    resource "PyObjC-Framework-Cocoa" do
        url "https://pypi.python.org/packages/f2/91/9a1847a442a8cd9f7e7ed183561c57b8644fd582f7ede0c5c3dc81407533/pyobjc-framework-Cocoa-3.2.1.tar.gz"
        sha256 "8215a528b552588f0024df03ef1c5f8edfa245301888c384f5b8c231f4c89431"
    end

    def install
        system "make", "BUILD_DIR=#{prefix}"
        res_dir = prefix/"Pulp.app/Contents/Resources"
        python3_setup_install(res_dir, "PyObjC-Core")
        python3_setup_install(res_dir, "PyObjC-Framework-Cocoa")
        python3_setup_install(res_dir, "Unidecode")
    end

    def python3_setup_install(py_prefix, resource_name)
        resource(resource_name).stage do
            ENV.delete "PYTHONPATH"
            system "python3", *python_setup_install_args(py_prefix)
        end
    end

    def python_setup_install_args(py_prefix)
        shim = <<-EOS.undent
            import setuptools, tokenize
            __file__ = 'setup.py'
            exec(compile(getattr(tokenize, 'open', open)(__file__).read()
              .replace('\\r\\n', '\\n'), __file__, 'exec'))
        EOS
        %W[
            -c
            #{shim}
            --no-user-cfg
            install
            --prefix=#{py_prefix}
            --install-lib=#{py_prefix}/python_modules
            --single-version-externally-managed
            --record=installed.txt
        ]
    end

end
