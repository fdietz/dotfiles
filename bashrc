source ~/.bash/aliases
source ~/.bash/completion
source ~/.bash/config
source ~/.bash/limit
source ~/.bash/prompt
source ~/.bash/ripgrep

# use .localrc for settings specific to one system
if [ -f ~/.bash_local.rc ]; then
  source ~/.bash_local.rc
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
