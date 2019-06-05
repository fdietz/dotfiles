source ~/.bash/config
source ~/.bash/functions
source ~/.bash/aliases
source ~/.bash/paths
source ~/.bash/rbenv
source ~/.bash/rvm
source ~/.bash/completion
source ~/.bash/ps1
source ~/.bash/elixir

ps1_set --prompt '\>' --notime

ulimit -n 200000
ulimit -u 2048

# use .localrc for settings specific to one system
if [ -f ~/.bash_local.rc ]; then
  source ~/.bash_local.rc
fi

