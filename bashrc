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

if command -v brew >/dev/null 2>&1; then
  # Load rupa's z if installed
  [ -f $(brew --prefix)/etc/profile.d/z.sh ] && source $(brew --prefix)/etc/profile.d/z.sh
fi
