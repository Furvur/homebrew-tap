class Router < Formula
  desc "Local HTTPS URLs for dev servers: https://myapp.test -> localhost:5173"
  homepage "https://github.com/Furvur/router-releases"
  version "0.2.0"
  license :cannot_represent

  depends_on :macos

  on_arm do
    url "https://github.com/Furvur/router-releases/releases/download/v0.2.0/router_0.2.0_darwin_arm64.tar.gz"
    sha256 "4a0302e2353494d51364bd780375f72c33ea49aeeadc535396032dd6c98d8fb9"
  end
  on_intel do
    url "https://github.com/Furvur/router-releases/releases/download/v0.2.0/router_0.2.0_darwin_amd64.tar.gz"
    sha256 "3021e047e09db9b9f0108f69693cd7d839d1fa9d1107f5b647036e900630c312"
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
