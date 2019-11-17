#!/bin/bash

# https://github.com/victoriadrake/dotfiles/blob/master/scripts/programs/vsc.sh

function install {
  code --install-extension ${1} --force
}

install bung87.rails
install bung87.vscode-gemfile
install castwide.solargraph
install christian-kohler.npm-intellisense
install CoenraadS.bracket-pair-colorizer
install DavidAnson.vscode-markdownlint
install dbaeumer.vscode-eslint
install donjayamanne.githistory
install eamodio.gitlens
install esbenp.prettier-vscode
install formulahendry.auto-close-tag
install Gruntfuggly.todo-tree
install Hridoy.rails-snippets
install iampeterbanjo.elixirlinter
install JakeBecker.elixir-ls
install joshjg.vscode-credo
install kumar-harsh.graphql-for-vscode
install misogi.ruby-rubocop
install mjmcloug.vscode-elixir
install mrorz.language-gettext
install ms-azuretools.vscode-docker
install ms-vscode-remote.remote-containers
install ms-vscode-remote.remote-ssh
install ms-vscode-remote.remote-ssh-edit
install ms-vscode-remote.remote-wsl
install ms-vscode-remote.vscode-remote-extensionpack
install ms-vscode.azure-account
install ms-vscode.Theme-TomorrowKit
install ms-vsonline.vsonline
install octref.vetur
install PKief.material-icon-theme
install rebornix.ruby
install redhat.vscode-yaml
install sdras.vue-vscode-snippets
install sianglim.slim
install sleistner.vscode-fileutils
install techer.open-in-browser
install ThreadHeap.serverless-ide-vscode
install wix.vscode-import-cost