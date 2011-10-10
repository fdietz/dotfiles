source ~/.bash/colors
source ~/.bash/config
source ~/.bash/aliases
source ~/.bash/paths
source ~/.bash/git
source ~/.bash/completion
source ~/.bash/rbenv
source ~/.bash/ps1

ps1_set --prompt '\>' --notime

# use .localrc for settings specific to one system
if [ -f ~/.bash_local.rc ]; then
  source ~/.bash_local.rc
fi