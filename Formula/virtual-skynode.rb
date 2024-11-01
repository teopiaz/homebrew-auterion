class VirtualSkynode < Formula
  include Language::Python::Virtualenv

  desc "Virtual Skynode simulates an Auterion Skynode for development purposes"
  homepage "https://auterion.com"
  url "https://dl.cloudsmith.io/public/auterion/public/raw/versions/0.0.13/virtual-skynode.tar.gz"
  sha256 "061cadb2011487af115f6a5180baa6612d0990c35c20a1086462aac99945ab19"
  version "0.0.13" 

  depends_on "qemu"
  depends_on "python3"

  resource "semver" do
    url "https://files.pythonhosted.org/packages/41/6c/a536cc008f38fd83b3c1b98ce19ead13b746b5588c9a0cb9dd9f6ea434bc/semver-3.0.2.tar.gz"
    sha256 "6253adb39c70f6e51afed2fa7152bcd414c411286088fb4b9effb133885ab4cc"
  end

  def install
    venv = virtualenv_create(libexec)
    venv.pip_install resource("semver")

    bin.install "virtual-skynode"
    bin.install "virtual-skynode-convert-rootfs"

    # Set executable permissions for virtual-skynode-convert-rootfs
    (bin/"virtual-skynode-convert-rootfs").chmod 0755

    # Create the share/virtual-skynode directory
    (share/"virtual-skynode").mkpath

    # Install the bzImage into the created directory
    (share/"virtual-skynode").install "bzImage"
  end
end