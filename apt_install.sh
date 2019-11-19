#!/bin/bash

sudo apt update

function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing ${1}..."
    sudo apt install -y $1
  else
    echo "Already installed: ${1}"
  fi
}

# dev tools required for installed languages
install automake
install autoconf
install libreadline-dev
install libncurses-dev
install libssl-dev
install libyaml-dev
install libxslt-dev
install libffi-dev
install libtool
install unixodbc-dev
install unzip
install curl

# other
install git
install gnupg2
install ripgrep
install vim
install firefox
