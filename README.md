<div align="center">

# asdf-dashlane-cli [![Build](https://github.com/ClemArt/asdf-dashlane-cli/actions/workflows/build.yml/badge.svg)](https://github.com/ClemArt/asdf-dashlane-cli/actions/workflows/build.yml) [![Lint](https://github.com/ClemArt/asdf-dashlane-cli/actions/workflows/lint.yml/badge.svg)](https://github.com/ClemArt/asdf-dashlane-cli/actions/workflows/lint.yml)

[dashlane-cli](https://cli.dashlane.com/) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

**TODO: adapt this section**

- `bash`, `curl`, `tar`, and [POSIX utilities](https://pubs.opengroup.org/onlinepubs/9699919799/idx/utilities.html).
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

# Install

Plugin:

```shell
asdf plugin add dashlane-cli
# or
asdf plugin add dashlane-cli https://github.com/ClemArt/asdf-dashlane-cli.git
```

dashlane-cli:

```shell
# Show all installable versions
asdf list-all dashlane-cli

# Install specific version
asdf install dashlane-cli latest

# Set a version globally (on your ~/.tool-versions file)
asdf global dashlane-cli latest

# Now dashlane-cli commands are available
dcli -V
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/ClemArt/asdf-dashlane-cli/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [ClemArt](https://github.com/ClemArt/)
