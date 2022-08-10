export PATH=~/.bin:/opt/homebrew/sbin:/opt/homebrew/bin:/opt/homebrew/share/npm/bin:$PATH
export PATH=~/.cargo/bin:$PATH
export GOPATH=~/src/gopath

# Setup terminal, and turn on colors
export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

# Enable color in grep export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'

# This resolves issues install the mysql, postgres, and other gems with native non universal binary extensions
# export ARCHFLAGS='-arch x86_64'

export LESS='--ignore-case --raw-control-chars'
export EDITOR='nvim'
# export EDITOR='vim'
# CTAGS Sorting in VIM/Emacs is better behaved with this in place
export LC_COLLATE=C

export HOMEBREW_NO_ANALYTICS=1
# Silence direnv
export DIRENV_LOG_FORMAT=

export PKG_CONFIG_PATH="$HOMEBREW_PATH/opt/pkg-config"

# Enable erl/iex history in Erlang 20
export ERL_AFLAGS="-kernel shell_history enabled"
export WEECHAT_HOME=~/.weechat
# Remove / from WORDCHARS so name/repo is 'two words'
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

export BAT_THEME=Nord
export ZK_NOTEBOOK_DIR=~/.notes
source ~/.github_pat

