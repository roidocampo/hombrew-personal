class Pulp < Formula
    desc "File viewer for MacOS (for pdf, ps, and djvu files)"
    homepage "https://github.com/roidocampo/pulp"
    url "https://github.com/roidocampo/pulp/archive/v1.0.1.tar.gz"
    sha256 "02ada85359e3c75ecd13f616e4372cbecc2afbbd8671f77b409a38d59d675319"
    version "1.0.1"

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
        url "https://pypi.python.org/packages/b0/4f/93d8b4beac7b686c3f1a8f682062a9e65c87e5e45a99863ea7e4ba43813f/pyobjc-core-4.0.tar.gz"
        sha256 "c132417a7122681d4b6841673970429fc423c81c702c58097b19c946bd9b35f7"
    end

    resource "PyObjC-Framework-Cocoa" do
        url "https://pypi.python.org/packages/a7/8d/fc2b9d569ba23775724849eeed39a53665b3b1058eac00c3d3ac3a54e3cc/pyobjc-framework-Cocoa-4.0.tar.gz"
        sha256 "851f95ba957ee2ab3b8f2b24dec18aa94a614bd056fa15439154ff1819f4b70e"
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
