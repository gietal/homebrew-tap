class Carthage < Formula
  desc "Decentralized dependency manager for Cocoa"
  homepage "https://github.com/Carthage/Carthage"
  url "https://github.com/Carthage/Carthage.git",
      tag:      "0.36.0",
      revision: "499c9cf8dafe5979e761397721f319db8bbe5859",
      shallow:  false
  license "MIT"
  head "https://github.com/Carthage/Carthage.git", shallow: false

  bottle do
    #root_url "https://homebrew.bintray.com/bottles"
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "a8dda58b245591307897cc3ce4f421350f319e5c9fd66ebfa8f8d45b0d031581"
    sha256 cellar: :any_skip_relocation, big_sur:       "39fe319f00259c08fcc6d0ca66c0b2240aa9f1b0f2d00f2a6b61d7c7d367b4f8"
    sha256 cellar: :any_skip_relocation, catalina:      "2ea99e7a332fc6a76a1ca43b087f56534e2c658e7155c0751ffa6407c5e0a528"
    sha256 cellar: :any_skip_relocation, mojave:        "334d9982e33f71850b1f467a170ab5c7c050f49a3c9f2429d7db4ac1450d975b"
  end

  depends_on xcode: ["10.0", :build]

  def install
    system "make", "prefix_install", "PREFIX=#{prefix}"
    bash_completion.install "Source/Scripts/carthage-bash-completion" => "carthage"
    zsh_completion.install "Source/Scripts/carthage-zsh-completion" => "_carthage"
    fish_completion.install "Source/Scripts/carthage-fish-completion" => "carthage.fish"
  end

  test do
    (testpath/"Cartfile").write 'github "jspahrsummers/xcconfigs"'
    system bin/"carthage", "update"
  end
end
