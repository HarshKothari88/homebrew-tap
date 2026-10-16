# Template for the formula in the tap repository HarshKothari88/homebrew-tap (Formula/git-stone.rb).
# After each release, set `version` and the four sha256 values from the files `git-stone-<target>.tar.gz.sha256`.
class GitStone < Formula
  desc "Save task boundaries as you work, turn them into atomic Git commits later"
  homepage "https://github.com/HarshKothari88/git-stone"
  version "0.1.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/HarshKothari88/git-stone/releases/download/v#{version}/git-stone-aarch64-apple-darwin.tar.gz"
      sha256 "77a788a0ac91bbae838fd8955ab359bfafe820e5881c08db3ab6546b17ddd7d2"
    end
    on_intel do
      url "https://github.com/HarshKothari88/git-stone/releases/download/v#{version}/git-stone-x86_64-apple-darwin.tar.gz"
      sha256 "b1bb257445c5796ef10a21af06eebd2fab851fcc7f1654cbca4a07bbf647db8a"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/HarshKothari88/git-stone/releases/download/v#{version}/git-stone-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8836a3ba7b71be17108b282faf94d60509d7d58ee4e7287242a785024dbfb0b5"
    end
    on_intel do
      url "https://github.com/HarshKothari88/git-stone/releases/download/v#{version}/git-stone-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fe24ee2dbb5f57f5db7eb6d226a7d058e59cbc18d48afaa2fee9c031e44b8d51"
    end
  end

  depends_on "git"

  def install
    bin.install "git-stone"
    man1.install "git-stone.1"
  end

  test do
    assert_match "git-stone #{version}", shell_output("#{bin}/git-stone version")
  end
end
