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
install libncurses-dev
install libssl-dev
install libxslt-dev
install libffi-dev
install libtool
install unixodbc-dev
install unzip
install curl
install git-core
install zlib1g-dev
install build-essential
install libssl-dev
install libreadline-dev
install libyaml-dev
install libsqlite3-dev
install sqlite3
install libxml2-dev
install libxslt1-dev
install libcurl4-openssl-dev
install software-properties-common
install libffi-dev
install libpq-dev

# other
install git
install gnupg2
install ripgrep
install vim
install firefox
install postgresql-11
install fonts-firacode
