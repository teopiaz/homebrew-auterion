class VirtualSkynode < Formula
    desc "Virtual Skynode simulates an Auterion Skynode for development purposes"
    homepage "https://auterion.com"
    url "https://dl.cloudsmith.io/public/auterion/public/raw/versions/0.0.8/virtual-skynode.tar.gz"
    sha256 "ebee169c128333ed58843bf43439d6e166dec67f30ae42e28cd5e4cabd3680ff"
    version "0.0.8" 
  
    depends_on "qemu"
    depends_on "python3"
  
    def install
      bin.install "virtual-skynode"
      bin.install "virtual-skynode-convert-rootfs"
        # Create the share/virtual-skynode directory
        (share/"virtual-skynode").mkpath

        # Install the bzImage into the created directory
        (share/"virtual-skynode").install "bzImage"
    end
  end