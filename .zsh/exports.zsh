export GOPATH=~/figma/gopath
export PATH=~/.bin:/opt/homebrew/sbin:/opt/homebrew/bin:/opt/homebrew/share/npm/bin:$PATH
export PATH=$PATH:/Applications/WezTerm.app/Contents/MacOS:~/.config/emacs/bin:$GOPATH/bin
export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"

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

# ask homebrew to not display it's beta os warning paragraph(s).
export HOMEBREW_DEVELOPER=1

# Enable YJIT on whatevers fit to build
export RUBY_CONFIGURE_OPTS=--enable-yjit
export RUBY_YJIT_ENABLE=1

export ASDF_GOLANG_MOD_VERSION_ENABLED=true

# catpuccin-mocha theme from https://github.com/catppuccin/fzf
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

if [ -d "$HOME/figma" ]; then
  export ZSH_BIZ_TIME=true
else
  export ZSH_BIZ_TIME=false
fi

if [[ $ZSH_BIZ_TIME == false ]]; then
  #Bring in gh exports
  source ~/.github_pat
fi
