# Contributing

Thanks for helping out! Bug reports and pull requests are welcome.

## Requirements

- [asdf](https://asdf-vm.com) 0.16 or newer
- [shellcheck](https://www.shellcheck.net/) and [shfmt](https://github.com/mvdan/sh) (versions pinned in `.tool-versions`; run `asdf install` in this repo to get them)

## Testing locally

The `asdf plugin test` command was removed in asdf 0.16. To test your changes, link your working copy as a plugin and install a version:

```shell
# Use this checkout as the plugin
asdf plugin add dashlane-cli "$(pwd)"

# Exercise the plugin scripts
asdf list all dashlane-cli
asdf install dashlane-cli latest
asdf set dashlane-cli latest
dcli --version

# Clean up
asdf plugin remove dashlane-cli
```

## Lint and format

```shell
scripts/lint.bash     # shellcheck + shfmt check
scripts/format.bash   # auto-format with shfmt
```

## Continuous integration

On every push and pull request, GitHub Actions runs the lint checks and an `asdf plugin test` on Linux and macOS (via [asdf-vm/actions](https://github.com/asdf-vm/actions)).

Pull request titles must follow [Conventional Commits](https://www.conventionalcommits.org/) (e.g. `feat: ...`, `fix: ...`, `docs: ...`); releases and the changelog are generated from them.
