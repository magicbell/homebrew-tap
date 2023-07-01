require "language/node"

class MagicbellCli < Formula
  desc "Work with MagicBell from the command-line"
  homepage "https://magicbell.com"
  url "https://registry.npmjs.org/@magicbell/cli/-/cli-1.3.0.tgz"
  sha256 "ee8cf6104850c036966560e532e449d589ad42f7dab0f30f2a87776f510d4bc0"
  license :cannot_represent # SEE LICENSE IN LICENSE

  livecheck do
    url "https://registry.npmjs.org/@magicbell/cli/latest"
    regex(/["']version["']:\s*?["']([^"']+)["']/i)
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir[libexec/"bin/*"]
  end

  test do
    assert_match(version.to_s, shell_output("#{bin}/magicbell --version"))
    assert_match(/you are not logged in/i, shell_output("#{bin}/magicbell logout"))
  end
end
