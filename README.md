# Ploy Homebrew tap

This tap publishes the signed-off macOS Agent bundle for
[Ploy](https://github.com/ZainCheung/ploy).

Install the released Agent on a clean Mac with one command:

```sh
brew install ZainCheung/tap/ploy
```

The Ploy release workflow publishes the versioned `ploy-agent-<version>.tar.gz`
asset before the formula is used. Upgrade an existing installation with:

```sh
brew upgrade ZainCheung/tap/ploy
ploy runner restart
```

The formula only installs the Node runtime dependency and Ploy CLI. It never
installs or changes Xcode, signing identities, certificates, or provisioning
profiles.
