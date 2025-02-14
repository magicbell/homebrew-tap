require "language/node"

class MagicbellCli < Formula
  desc "Work with MagicBell from the command-line"
  homepage "https://magicbell.com"
  url "https://registry.npmjs.org/@magicbell/cli/-/cli-4.2.1.tgz"
  sha256 "7f8c0f60fe87382ffd9775b7282586d358ecdfd848b8f4eadfc582f8e031fbad"
  license :cannot_represent # SEE LICENSE IN LICENSE

  livecheck do
    url "https://registry.npmjs.org/@magicbell/cli/latest"
    regex(/["']version["']:\s*?["']([^"']+)["']/i)
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match(version.to_s, shell_output("#{bin}/magicbell --version"))
    assert_match(/you are not logged in/i, shell_output("#{bin}/magicbell logout"))
  end
end
