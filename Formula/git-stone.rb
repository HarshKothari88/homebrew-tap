# Template for the formula in the tap repository HarshKothari88/homebrew-tap (Formula/git-stone.rb).
# After each release, set `version` and the four sha256 values from the files `git-stone-<target>.tar.gz.sha256`.
class GitStone < Formula
  desc "Save task boundaries as you work, turn them into atomic Git commits later"
  homepage "https://github.com/HarshKothari88/git-stone"
  version "0.2.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/HarshKothari88/git-stone/releases/download/v#{version}/git-stone-aarch64-apple-darwin.tar.gz"
      sha256 "750ca19fde984f445a0ca66991a7c4e884599be934519a47da70b71b99a4c757"
    end
    on_intel do
      url "https://github.com/HarshKothari88/git-stone/releases/download/v#{version}/git-stone-x86_64-apple-darwin.tar.gz"
      sha256 "a92c7379187bf1171b2da31cc24ae93ffe1ee59b1603a22d905cf1da4066c471"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/HarshKothari88/git-stone/releases/download/v#{version}/git-stone-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e0f285c06c363c58d8e76308d8d9f44ca257f275138c5736cda35271d1482bbb"
    end
    on_intel do
      url "https://github.com/HarshKothari88/git-stone/releases/download/v#{version}/git-stone-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f403127754ce3b93d1f28b74ae4ebd9daf12d20e460f76d0a0f967d5d94cfa24"
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
