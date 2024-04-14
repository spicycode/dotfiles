export GOPATH=~/src/gopath
export PATH=~/.bin:/opt/homebrew/sbin:/opt/homebrew/bin:/opt/homebrew/share/npm/bin:$PATH
export PATH=~/.cargo/bin:$PATH:/Applications/WezTerm.app/Contents/MacOS:~/.config/emacs/bin:$GOPATH/bin

# Setup terminal, and turn on colors
export TERM=xterm-256color
export CLICOLOR=1

# for gnu flavored ls and exa
export TIME_STYLE=long-iso

# Enable color in grep export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'

export LESS='--ignore-case --raw-control-chars'
export EDITOR='nvim'

export HOMEBREW_NO_ANALYTICS=1

# Silence direnv
export DIRENV_LOG_FORMAT=

export PKG_CONFIG_PATH="$HOMEBREW_PATH/opt/pkg-config"

# Enable erl/iex history in Erlang 20
export ERL_AFLAGS="-kernel shell_history enabled"

# Remove / from WORDCHARS so name/repo is 'two words'
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

export HOMEBREW_NO_ENV_HINTS=true

# Enable YJIT on whatevers fit to build
export RUBY_CONFIGURE_OPTS=--enable-yjit
export RUBY_YJIT_ENABLE=1

export ASDF_GOLANG_MOD_VERSION_ENABLED=true

# Bring in gh exports
source ~/.github_pat
