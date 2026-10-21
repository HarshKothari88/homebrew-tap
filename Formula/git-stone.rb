# Template for the formula in the tap repository HarshKothari88/homebrew-tap (Formula/git-stone.rb).
# After each release, set `version` and the four sha256 values from the files `git-stone-<target>.tar.gz.sha256`.
class GitStone < Formula
  desc "Save task boundaries as you work, turn them into atomic Git commits later"
  homepage "https://github.com/HarshKothari88/git-stone"
  version "0.4.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/HarshKothari88/git-stone/releases/download/v#{version}/git-stone-aarch64-apple-darwin.tar.gz"
      sha256 "42f13cb7eaab15a7b8fae8f2361997865a267dec0cc7fbcb22fecd812c872738"
    end
    on_intel do
      url "https://github.com/HarshKothari88/git-stone/releases/download/v#{version}/git-stone-x86_64-apple-darwin.tar.gz"
      sha256 "952008f1652d7e79d06a98adfa6f655c515607b916889fac6dabb5569e562c71"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/HarshKothari88/git-stone/releases/download/v#{version}/git-stone-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "07f2d0572d1e2bca3ccaf07c2716a467eb34845cfc72e73025e4cf00ac0b5427"
    end
    on_intel do
      url "https://github.com/HarshKothari88/git-stone/releases/download/v#{version}/git-stone-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "30900f21abc582833d580bfde027405931e9645cd69efa16e3159ea5a4a29a83"
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
