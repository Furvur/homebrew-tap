class Router < Formula
  desc "Local HTTPS URLs for dev servers: https://myapp.test -> localhost:5173"
  homepage "https://github.com/Furvur/router-releases"
  version "0.1.1"
  license :cannot_represent

  depends_on :macos

  on_arm do
    url "https://github.com/Furvur/router-releases/releases/download/v0.1.1/router_0.1.1_darwin_arm64.tar.gz"
    sha256 "7d62643406e05c9b3519b9e11077ddef7278a14dada1c35673332e8fadfd7944"
  end
  on_intel do
    url "https://github.com/Furvur/router-releases/releases/download/v0.1.1/router_0.1.1_darwin_amd64.tar.gz"
    sha256 "c9e40c87ab02ace0c86086ec5ef137c4f51b347e84d5a7cd98df12c851ae6e3f"
  end

  def install
    bin.install "router"
    prefix.install "LICENSE", "THIRD_PARTY_NOTICES"
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
