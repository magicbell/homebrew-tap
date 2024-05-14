require "language/node"

class MagicbellCli < Formula
  desc "Work with MagicBell from the command-line"
  homepage "https://magicbell.com"
  url "https://registry.npmjs.org/@magicbell/cli/-/cli-3.2.4.tgz"
  sha256 "1a7981144e10aac04207d9ccb45760901941cc294a4f320da6fea8f80aea4250"
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
    assert_match(/you are not logged in/i, shell_output("#{bin}/magicbell logout"))
  end
end
