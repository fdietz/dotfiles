eval "$(/opt/homebrew/bin/brew shellenv)"
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

. $HOME/.asdf/asdf.sh
#. $HOME/.asdf/completions/asdf.bash

###### java ######

export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"
# export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/zulu-16.jdk/Contents/Home"
export ES_JAVA_HOME="/Library/Java/JavaVirtualMachines/zulu-16.jdk/Contents/Home"

###### ulimit ######

ulimit -n 200000
ulimit -u 2048

###### rubocop ######

# https://github.com/fohte/rubocop-daemon
export PATH="/usr/local/bin/rubocop-daemon-wrapper:$PATH"
export RUBOCOP_DAEMON_USE_BUNDLER=true
# https://github.com/puma/puma/issues/2328
export PUMA_DISABLE_SSL=1

# https://github.com/ged/ruby-pg/issues/538
export PGGSSENCMODE="disable"

export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Added by OrbStack: command-line tools and integration
source ~/.orbstack/shell/init.zsh 2>/dev/null || :

# Created by `pipx` on 2024-05-27 17:33:31
export PATH="$PATH:/Users/fdietz/.local/bin"
