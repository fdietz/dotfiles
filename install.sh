#!/bin/bash

dotfiles="$HOME/.dotfiles"

# to error out
warn() {
  echo "$1" >&2
}

die() {
  warn "$1"
  exit 1
}

lnif() {
  if [ ! -e $2 ] ; then
    ln -s $1 $2
  fi
}

echo "Installing/Updating dotfiles...\n"

if [ ! -e $dotfiles/.git ]; then
  echo "Cloning dotfiles\n"
  git clone https://github.com/fdietz/dotfiles.git $dotfiles
else
  echo "Updating dotfiles\n"
  cd $dotfiles && git pull
fi

# bash
echo "Setting up bash...\n"
lnif $dotfiles/bash_profile $HOME/.bash_profile
lnif $dotfiles/bashrc $HOME/.bashrc
lnif $dotfiles/bash $HOME/.bash

# zshell
echo "Setting up zshell...\n"
lnif $dotfiles/zprofile $HOME/.zprofile

# git
echo "Setting up dev tools git...\n"
lnif $dotfiles/gitconfig $HOME/.gitconfig
lnif $dotfiles/gitignore $HOME/.gitignore

# ruby
echo "Setting up dev tools ruby...\n"
lnif $dotfiles/gemrc $HOME/.gemrc
lnif $dotfiles/irbrc $HOME/.irbirc
lnif $dotfiles/rdebugrc $HOME/.rdebugrc

# asdf
lnif $dotfiles/asdfrc $HOME/.asdfrc

# misc
lnif $dotfiles/ctags $HOME/.ctags
lnif $dotfiles/psqlrc $HOME/.psqlrc

# vim
echo "Setting up vim...\n"
lnif $dotfiles/vimrc $HOME/.vimrc
lnif $dotfiles/gvimrc $HOME/.gvimrc
lnif $dotfiles/vimrc.bundles $HOME/.vimrc.bundles

