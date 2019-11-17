# fdietz dotfiles

These are config files to set up a system the way I like it.

## Installation

Copy and paste the following line into your terminal:

```bash
curl https://raw.github.com/fdietz/dotfiles/master/install.sh -L -o - | sh
```

Or manually clone dotfiles and run the installer script:

```bash
git clone https://github.com/fdietz/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

## Symlink dot files

```bash
./install.sh
```

## MacOS

Use `homebrew-bundle` to install all packages

```bash
brew bundle
```

Use the MacOS script to configure the system:

```bash
./mac
```

## Linux

```bash
./apt_install.sh
```

## ASDF Version Manager

```bash
./asdf_install.sh
```

## Credits

Lots of vim setup ideas taken from [spf13-vim](http://vim.spf13.com/index.html).
