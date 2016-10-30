source ~/.bash/config
source ~/.bash/functions
source ~/.bash/aliases
source ~/.bash/paths
source ~/.bash/rbenv
source ~/.bash/completion
source ~/.bash/ps1

ps1_set --prompt '\>' --notime

# use .localrc for settings specific to one system
if [ -f ~/.bash_local.rc ]; then
  source ~/.bash_local.rc
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
