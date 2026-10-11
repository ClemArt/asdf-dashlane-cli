<div align="center">

# asdf-dashlane-cli [![Build](https://github.com/ClemArt/asdf-dashlane-cli/actions/workflows/build.yml/badge.svg)](https://github.com/ClemArt/asdf-dashlane-cli/actions/workflows/build.yml) [![Lint](https://github.com/ClemArt/asdf-dashlane-cli/actions/workflows/lint.yml/badge.svg)](https://github.com/ClemArt/asdf-dashlane-cli/actions/workflows/lint.yml)

[dashlane-cli](https://cli.dashlane.com/) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Supported platforms](#supported-platforms)
- [Quick start](#quick-start)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- [asdf](https://asdf-vm.com/guide/getting-started.html) **0.16 or newer** (the Go rewrite). The commands below use the current syntax; older asdf versions use different command names (see [Migrating from older asdf](#migrating-from-older-asdf)).
- `bash`, `curl`, `git`, and standard [POSIX utilities](https://pubs.opengroup.org/onlinepubs/9699919799/idx/utilities.html).

# Supported platforms

The plugin downloads the official precompiled `dcli` binary from the [Dashlane CLI releases](https://github.com/Dashlane/dashlane-cli/releases).

| OS    | x86_64 | arm64                             |
| ----- | ------ | --------------------------------- |
| Linux | yes    | no (no upstream precompiled build) |
| macOS | yes    | yes                               |

# Quick start

```shell
# 1. Add the plugin
asdf plugin add dashlane-cli https://github.com/ClemArt/asdf-dashlane-cli.git

# 2. Install the latest version
asdf install dashlane-cli latest

# 3. Make it your default version (written to ~/.tool-versions)
asdf set --home dashlane-cli latest

# 4. Check that it works
dcli --version
```

# Usage

| I want to...                                  | Command                                       |
| --------------------------------------------- | --------------------------------------------- |
| List all installable versions                 | `asdf list all dashlane-cli`                  |
| Show the latest version                       | `asdf latest dashlane-cli`                    |
| Install a specific version                    | `asdf install dashlane-cli <version>`         |
| Use a version everywhere (default)            | `asdf set --home dashlane-cli <version>`      |
| Use a version only in the current directory   | `asdf set dashlane-cli <version>`             |
| Show the versions in use                      | `asdf current dashlane-cli`                   |
| List installed versions                       | `asdf list dashlane-cli`                      |
| Uninstall a version                           | `asdf uninstall dashlane-cli <version>`       |
| Update the plugin                             | `asdf plugin update dashlane-cli`             |
| Remove the plugin                             | `asdf plugin remove dashlane-cli`             |

`asdf set` writes a `.tool-versions` file. You can also edit that file by hand and run `asdf install` (with no arguments) to install every tool it lists:

```text
dashlane-cli 6.2.0
```

Once a version is selected, the `dcli` command is available in your shell. If you have just installed the plugin and `dcli` is not found, make sure the asdf shims directory is in your `PATH` (see the [asdf setup guide](https://asdf-vm.com/guide/getting-started.html#_2-configure-asdf)) and run `asdf reshim dashlane-cli`.

## Using a GitHub token

Listing versions queries GitHub. If you hit API rate limits, export a token before running asdf:

```shell
export GITHUB_API_TOKEN=<your token>
```

## Migrating from older asdf

If you are following an older tutorial, these commands were renamed or removed in asdf 0.16:

| Deprecated                      | Use instead                                 |
| ------------------------------- | ------------------------------------------- |
| `asdf plugin-add <name> <url>`  | `asdf plugin add <name> <url>`              |
| `asdf plugin-list`              | `asdf plugin list`                          |
| `asdf plugin-update <name>`     | `asdf plugin update <name>`                 |
| `asdf plugin-remove <name>`     | `asdf plugin remove <name>`                 |
| `asdf list-all <name>`          | `asdf list all <name>`                      |
| `asdf global <name> <version>`  | `asdf set --home <name> <version>`          |
| `asdf local <name> <version>`   | `asdf set <name> <version>`                 |
| `asdf shell <name> <version>`   | `export ASDF_DASHLANE_CLI_VERSION=<version>` |
| `asdf plugin test ...`          | See the [contributing guide](contributing.md) |

For everything else, see the [asdf documentation](https://asdf-vm.com/manage/commands.html).

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/ClemArt/asdf-dashlane-cli/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [ClemArt](https://github.com/ClemArt/)
