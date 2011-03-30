source ~/.bash/config
source ~/.bash/aliases
source ~/.bash/paths
source ~/.bash/git
source ~/.bash/completion

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# use .localrc for settings specific to one system
if [ -f ~/.bash_local.rc ]; then
  source ~/.bash_local.rc
fi