# typed: true
# frozen_string_literal: true

require "language/node"

# Work with MagicBell from the command-line
class MagicbellCli < Formula
  desc "Work with MagicBell from the command-line"
  homepage "https://magicbell.com"
  url "https://registry.npmjs.org/@magicbell/cli/-/cli-1.0.0.tgz"
  sha256 "c5a64c61df069936a9a07609ea35f2d311405473ccb319ba21e2cf6f9bc26132"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir[libexec/"bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/magicbell --version 2>&1")
  end
end
