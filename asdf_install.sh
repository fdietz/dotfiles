#!/bin/bash

if [ ! -d "$HOME/.asdf" ]; then
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.5
  echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc
  echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc
  source ~/.bashrc
fi

# ruby
asdf plugin-add ruby
asdf install ruby 3.1.1
asdf global ruby 3.1.1

# node
asdf plugin-add nodejs
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
asdf install nodejs 16.11.0
asdf global nodejs 16.11.0

# erlang
export MACOSX_DEPLOYMENT_TARGET=10.14
asdf plugin-add erlang
asdf install erlang 22.1.4
asdf global erlang 22.1.4

# elixir
asdf plugin-add elixir
asdf install elixir 1.9.4
asdf global elixir 1.9.4

# elixir - install hex version manager
mix local.hex
# elixir - install phoenix
curl -o phoenix_new.ez https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez
mix archive.install phoenix_new.ez

