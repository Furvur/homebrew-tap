class Router < Formula
  desc "Local HTTPS URLs for dev servers: https://myapp.test -> localhost:5173"
  homepage "https://github.com/Furvur/router-releases"
  version "0.1.0"
  license :cannot_represent

  depends_on :macos

  on_arm do
    url "https://github.com/Furvur/router-releases/releases/download/v0.1.0/router_0.1.0_darwin_arm64.tar.gz"
    sha256 "89cb07fc503877a58a02cfa44b8cd3191eecd76c0f319ab8e809f8ab46554b55"
  end
  on_intel do
    url "https://github.com/Furvur/router-releases/releases/download/v0.1.0/router_0.1.0_darwin_amd64.tar.gz"
    sha256 "93ad87d81b0aeaff8b5eaa2b4e0c2fa7be8d9010e85d3fc6f2b699b0414a082c"
  end

  def install
    bin.install "router"
  end

  def caveats
    <<~EOS
      Add a route from any folder; the first one sets up this Mac
      (trusted local CA, .test DNS, background daemon):
        router add myapp 5173

      Remove the setup with: router uninstall
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/router version")
  end
end
