source ~/.bash/colors
source ~/.bash/config
source ~/.bash/aliases
source ~/.bash/paths
source ~/.bash/git
source ~/.bash/completion
source ~/.bash/ps1

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

ps1_set --prompt '\>' --notime

# use .localrc for settings specific to one system
if [ -f ~/.bash_local.rc ]; then
  source ~/.bash_local.rc
fi