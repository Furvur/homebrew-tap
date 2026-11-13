class Router < Formula
  desc "Local HTTPS URLs for dev servers: https://myapp.test -> localhost:5173"
  homepage "https://github.com/Furvur/router-releases"
  version "0.2.1"
  license :cannot_represent

  depends_on :macos

  on_arm do
    url "https://github.com/Furvur/router-releases/releases/download/v0.2.1/router_0.2.1_darwin_arm64.tar.gz"
    sha256 "972f5e77232a5d0e11d6ea0f6c14ebaba3e2a13eda8d7ae65c4f96d7102ec83f"
  end
  on_intel do
    url "https://github.com/Furvur/router-releases/releases/download/v0.2.1/router_0.2.1_darwin_amd64.tar.gz"
    sha256 "3a6d00865af610460326f64a95bdd847453be188936b4279f7e9c34b1e8d0d74"
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
