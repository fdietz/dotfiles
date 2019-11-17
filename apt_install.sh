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
install
automake 
autoconf 
libreadline-dev
libncurses-dev 
libssl-dev 
libyaml-dev
libxslt-dev 
libffi-dev 
libtool 
unixodbc-dev
unzip curl

# other
install git
install gnupg2
install ripgrep
install vim
install firefox
