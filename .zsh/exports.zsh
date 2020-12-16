# Currently this path is appendend to dynamically when picking a ruby version
export PATH=~/.bin:$HOMEBREW_PATH/sbin:$HOMEBREW_PATH/bin:$HOMEBREW_PATH/share/npm/bin:$PATH
export PATH=~/.cargo/bin:$PATH
export RBENV_ROOT=$HOMEBREW_PATH/var/rbenv
export GOPATH=$HOME/src/gopath

# Setup terminal, and turn on colors
export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

# Enable color in grep export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'

# This resolves issues install the mysql, postgres, and other gems with native non universal binary extensions
# export ARCHFLAGS='-arch x86_64'

export LESS='--ignore-case --raw-control-chars'
# export EDITOR='nvim'
export EDITOR='vim'
# CTAGS Sorting in VIM/Emacs is better behaved with this in place
export LC_COLLATE=C

export HOMEBREW_NO_ANALYTICS=1
# Silence direnv
export DIRENV_LOG_FORMAT=

export PKG_CONFIG_PATH="$HOMEBREW_PATH/opt/pkg-config"

# Enable erl/iex history in Erlang 20
export ERL_AFLAGS="-kernel shell_history enabled"

# SpaceShip prompt options
# https://github.com/denysdovhan/spaceship-prompt/blob/master/docs/Options.md#package-version-package
export SPACESHIP_PACKAGE_SHOW=false
export SPACESHIP_DOCKER_SHOW=false
