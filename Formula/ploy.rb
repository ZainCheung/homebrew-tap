class Ploy < Formula
  desc "First-party macOS runner for Ploy local iOS preview builds"
  homepage "https://github.com/ZainCheung/ploy-cli"
  version "0.1.4"
  url "https://github.com/ZainCheung/ploy-cli/releases/download/v#{version}/ploy-agent-#{version}.tar.gz"
  sha256 "e05f0b894030e3174031e3c68834420caeb746b10804a3f0d3e811ab85bea2e0"

  depends_on "node@22"

  def install
    libexec.install "cli.js", "VERSION", "README.txt"
    # Homebrew's opt prefix is stable across Cellar upgrades. The launchd
    # plist stores process.argv[1], so this keeps the service on the current
    # keg after `brew upgrade ZainCheung/tap/ploy`.
    stable_cli = "#{opt_prefix}/libexec/cli.js"
    (bin / "ploy").write <<~SH
      #!/bin/sh
      exec "#{Formula["node@22"].opt_bin}/node" "#{stable_cli}" "$@"
    SH
    chmod 0555, bin / "ploy"
  end

  test do
    assert_predicate bin / "ploy", :executable?
    assert_equal version, shell_output("#{bin}/ploy version").strip
  end
end
