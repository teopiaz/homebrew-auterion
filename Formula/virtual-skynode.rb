class VirtualSkynode < Formula
    desc "Virtual Skynode simulates an Auterion Skynode for development purposes"
    homepage "https://auterion.com"
    url "https://dl.cloudsmith.io/public/auterion/public/raw/versions/0.0.10/virtual-skynode.tar.gz"
    sha256 "7355ea7d11adc8093b5938ed900a2d9d693ef8ada9fe15cd0db038fe1648dca7"
    version "0.0.10" 
  
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