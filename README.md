# Ploy Homebrew tap

This tap publishes the signed-off macOS Agent bundle for
[Ploy](https://github.com/ZainCheung/ploy-cli). The formula is metadata only;
the release artifact is hosted by the release-only
[`ZainCheung/ploy-cli`](https://github.com/ZainCheung/ploy-cli) repository.

Install the released Agent on a clean Mac with one command:

```sh
brew install ZainCheung/tap/ploy
```

The Ploy source release workflow publishes the versioned
`ploy-agent-<version>.tar.gz` asset to `ploy-cli` before the formula is used;
the formula pins that asset with its exact SHA-256 checksum. Upgrade an
existing installation with:

```sh
brew upgrade ZainCheung/tap/ploy
ploy runner restart
```

The formula only installs the Node runtime dependency and Ploy CLI. It never
installs or changes Xcode, signing identities, certificates, or provisioning
profiles.
