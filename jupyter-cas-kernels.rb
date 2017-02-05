class JupyterCasKernels < Formula

    desc "Some kernels for jupyter"
    homepage "https://github.com/roidocampo/jupyter-cas-kernels"
    url "https://github.com/roidocampo/jupyter-cas-kernels/archive/v0.3.tar.gz"
    sha256 "00ef0c1f01abc71412de2081d63c027c921842ec6ba3cafc56df9270e2062981"
    version "0.3"

    resource "appdirs" do
        url "https://files.pythonhosted.org/packages/bd/66/0a7f48a0f3fb1d3a4072bceb5bbd78b1a6de4d801fb7135578e7c7b1f563/appdirs-1.4.0.tar.gz"
        sha256 "8fc245efb4387a4e3e0ac8ebcc704582df7d72ff6a42a53f5600bbb18fdaadc5"
    end

    resource "appnope" do
        url "https://files.pythonhosted.org/packages/26/34/0f3a5efac31f27fabce64645f8c609de9d925fe2915304d1a40f544cff0e/appnope-0.1.0.tar.gz"
        sha256 "8b995ffe925347a2138d7ac0fe77155e4311a0ea6d6da4f5128fe4b3cbe5ed71"
    end

    resource "backports_abc" do
        url "https://files.pythonhosted.org/packages/68/3c/1317a9113c377d1e33711ca8de1e80afbaf4a3c950dd0edfaf61f9bfe6d8/backports_abc-0.5.tar.gz"
        sha256 "033be54514a03e255df75c5aee8f9e672f663f93abb723444caec8fe43437bde"
    end

    resource "backports.shutil_get_terminal_size" do
        url "https://files.pythonhosted.org/packages/ec/9c/368086faa9c016efce5da3e0e13ba392c9db79e3ab740b763fe28620b18b/backports.shutil_get_terminal_size-1.0.0.tar.gz"
        sha256 "713e7a8228ae80341c70586d1cc0a8caa5207346927e23d09dcbcaf18eadec80"
    end

    resource "certifi" do
        url "https://files.pythonhosted.org/packages/b6/fa/ca682d5ace0700008d246664e50db8d095d23750bb212c0086305450c276/certifi-2017.1.23.tar.gz"
        sha256 "81877fb7ac126e9215dfb15bfef7115fdc30e798e0013065158eed0707fd99ce"
    end

    resource "decorator" do
        url "https://files.pythonhosted.org/packages/cc/ac/5a16f1fc0506ff72fcc8fd4e858e3a1c231f224ab79bb7c4c9b2094cc570/decorator-4.0.11.tar.gz"
        sha256 "953d6bf082b100f43229cf547f4f97f97e970f5ad645ee7601d55ff87afdfe76"
    end

    resource "enum34" do
        url "https://files.pythonhosted.org/packages/bf/3e/31d502c25302814a7c2f1d3959d2a3b3f78e509002ba91aea64993936876/enum34-1.1.6.tar.gz"
        sha256 "8ad8c4783bf61ded74527bffb48ed9b54166685e4230386a9ed9b1279e2df5b1"
    end

    resource "ipykernel" do
        url "https://files.pythonhosted.org/packages/2d/1b/eee47b5cd8b2fcdde587cad1e8d3f7eae7bdfa1d36a94ad316fc5fbee833/ipykernel-4.5.2.tar.gz"
        sha256 "5a54f25f0e6c8ee74c362c23f9a95e10e74c6b7f5ef42059c861ff6f26d89462"
    end

    resource "ipython" do
        url "https://files.pythonhosted.org/packages/6e/cf/c2a3ca5942e2d8084574157a8f818efafb7218204cd9e41166c92c452e07/ipython-5.2.2.tar.gz"
        sha256 "6ee1c89f6031e0c86727820ad394c6eb4d3ac28de48e0df3b9367ccf92e212e2"
    end

    resource "ipython_genutils" do
        url "https://files.pythonhosted.org/packages/71/b7/a64c71578521606edbbce15151358598f3dfb72a3431763edc2baf19e71f/ipython_genutils-0.1.0.tar.gz"
        sha256 "3a0624a251a26463c9dfa0ffa635ec51c4265380980d9a50d65611c3c2bd82a6"
    end

    resource "jupyter_client" do
        url "https://files.pythonhosted.org/packages/88/03/d8e218721af0b084d4fda5e3bb89dc201505780f96ae060bf5e3e67c7707/jupyter_client-4.4.0.tar.gz"
        sha256 "c99a52fac2e5b7a3b714e9252ebf72cbf97536d556ae2b5082baccc3e5cd52ee"
    end

    resource "jupyter_core" do
        url "https://files.pythonhosted.org/packages/bc/d0/8f57f733913fbd4ce1a01991b008bace8dcf05158080821c6de76b4c5d01/jupyter_core-4.2.1.tar.gz"
        sha256 "89c55399c8437f777197c2c82c1ff5639c7f71d4eb2f172a81afa120b68dc7b3"
    end

    resource "packaging" do
        url "https://files.pythonhosted.org/packages/c6/70/bb32913de251017e266c5114d0a645f262fb10ebc9bf6de894966d124e35/packaging-16.8.tar.gz"
        sha256 "5d50835fdf0a7edf0b55e311b7c887786504efea1177abd7e69329a8e5ea619e"
    end

    resource "pathlib2" do
        url "https://files.pythonhosted.org/packages/ab/d8/ac7489d50146f29d0a14f65545698f4545d8a6b739b24b05859942048b56/pathlib2-2.2.1.tar.gz"
        sha256 "ce9007df617ef6b7bd8a31cd2089ed0c1fed1f7c23cf2bf1ba140b3dd563175d"
    end

    resource "pexpect" do
        url "https://files.pythonhosted.org/packages/e8/13/d0b0599099d6cd23663043a2a0bb7c61e58c6ba359b2656e6fb000ef5b98/pexpect-4.2.1.tar.gz"
        sha256 "3d132465a75b57aa818341c6521392a06cc660feb3988d7f1074f39bd23c9a92"
    end

    resource "pickleshare" do
        url "https://files.pythonhosted.org/packages/69/fe/dd137d84daa0fd13a709e448138e310d9ea93070620c9db5454e234af525/pickleshare-0.7.4.tar.gz"
        sha256 "84a9257227dfdd6fe1b4be1319096c20eb85ff1e82c7932f36efccfe1b09737b"
    end

    resource "prompt_toolkit" do
        url "https://files.pythonhosted.org/packages/23/be/4876b52d5cc159cbd4b0ff6e7aa419a26470849a43a8f647857a4a24467b/prompt_toolkit-1.0.13.tar.gz"
        sha256 "33d68ca09f76cd73287fde7df5748ffacf26a8238dd61ee81ac50860ea7c6776"
    end

    resource "ptyprocess" do
        url "https://files.pythonhosted.org/packages/db/d7/b465161910f3d1cef593c5e002bff67e0384898f597f1a7fdc8db4c02bf6/ptyprocess-0.5.1.tar.gz"
        sha256 "0530ce63a9295bfae7bd06edc02b6aa935619f486f0f1dc0972f516265ee81a6"
    end

    resource "Pygments" do
        url "https://files.pythonhosted.org/packages/71/2a/2e4e77803a8bd6408a2903340ac498cb0a2181811af7c9ec92cb70b0308a/Pygments-2.2.0.tar.gz"
        sha256 "dbae1046def0efb574852fab9e90209b23f556367b5a320c0bcb871c77c3e8cc"
    end

    resource "pyparsing" do
        url "https://files.pythonhosted.org/packages/38/bb/bf325351dd8ab6eb3c3b7c07c3978f38b2103e2ab48d59726916907cd6fb/pyparsing-2.1.10.tar.gz"
        sha256 "811c3e7b0031021137fc83e051795025fcb98674d07eb8fe922ba4de53d39188"
    end

    resource "pyzmq" do
        url "https://files.pythonhosted.org/packages/af/37/8e0bf3800823bc247c36715a52e924e8f8fd5d1432f04b44b8cd7a5d7e55/pyzmq-16.0.2.tar.gz"
        sha256 "0322543fff5ab6f87d11a8a099c4c07dd8a1719040084b6ce9162bcdf5c45c9d"
    end

    resource "scandir" do
        url "https://files.pythonhosted.org/packages/95/40/ddbcd295ee58d5c1126645890bcf87853e4075547308884e4f8ada27f195/scandir-1.4.tar.gz"
        sha256 "ada8d3ddc82fd168b3f46feb393d37c722ed0553a10a3ce5426ddc5ec17d597a"
    end

    resource "simplegeneric" do
        url "https://files.pythonhosted.org/packages/3d/57/4d9c9e3ae9a255cd4e1106bb57e24056d3d0709fc01b2e3e345898e49d5b/simplegeneric-0.8.1.zip"
        sha256 "dc972e06094b9af5b855b3df4a646395e43d1c9d0d39ed345b7393560d0b9173"
    end

    resource "singledispatch" do
        url "https://files.pythonhosted.org/packages/d9/e9/513ad8dc17210db12cb14f2d4d190d618fb87dd38814203ea71c87ba5b68/singledispatch-3.4.0.3.tar.gz"
        sha256 "5b06af87df13818d14f08a028e42f566640aef80805c3b50c5056b086e3c2b9c"
    end

    resource "six" do
        url "https://files.pythonhosted.org/packages/b3/b2/238e2590826bfdd113244a40d9d3eb26918bd798fc187e2360a8367068db/six-1.10.0.tar.gz"
        sha256 "105f8d68616f8248e24bf0e9372ef04d3cc10104f1980f54d57b2ce73a5ad56a"
    end

    resource "tornado" do
        url "https://files.pythonhosted.org/packages/1e/7c/ea047f7bbd1ff22a7f69fe55e7561040e3e54d6f31da6267ef9748321f98/tornado-4.4.2.tar.gz"
        sha256 "2898f992f898cd41eeb8d53b6df75495f2f423b6672890aadaf196ea1448edcc"
    end

    resource "traitlets" do
        url "https://files.pythonhosted.org/packages/b1/d6/5b5aa6d5c474691909b91493da1e8972e309c9f01ecfe4aeafd272eb3234/traitlets-4.3.1.tar.gz"
        sha256 "ba8c94323ccbe8fd792e45d8efe8c95d3e0744cc8c085295b607552ab573724c"
    end

    resource "wcwidth" do
        url "https://files.pythonhosted.org/packages/55/11/e4a2bb08bb450fdbd42cc709dd40de4ed2c472cf0ccb9e64af22279c5495/wcwidth-0.1.7.tar.gz"
        sha256 "3df37372226d6e63e1b1e1eda15c594bca98a22d33a23832a90998faa96bc65e"
    end

    include Language::Python::Virtualenv

    def install
        venv = virtualenv_create(libexec)
        venv.pip_install resources
        system "make", "install", 
            "PREFIX=#{prefix}",
            "PYTHON=#{libexec}/bin/python2.7",
            "MODULE_BASEDIR=#{libexec}/lib/python2.7/site-packages"
    end

end
