require "language/node"

class MagicbellCli < Formula
  desc "Work with MagicBell from the command-line"
  homepage "https://magicbell.com"
  url "https://registry.npmjs.org/@magicbell/cli/-/cli-2.0.3.tgz"
  sha256 "9a2af9094382e26b8d3f7e5accb512ae05a6e3f91c1f94de21f9f7e7b917c9f1"
  license :cannot_represent # SEE LICENSE IN LICENSE

  livecheck do
    url "https://registry.npmjs.org/@magicbell/cli/latest"
    regex(/["']version["']:\s*?["']([^"']+)["']/i)
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match(version.to_s, shell_output("#{bin}/magicbell --version"))
    assert_match(/you are not logged in./i, shell_output("#{bin}/magicbell logout"))
  end
end
