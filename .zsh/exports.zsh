# Currently this path is appendend to dynamically when picking a ruby version
export PATH=node_modules/.bin:/usr/local/sbin:/usr/local/bin:/usr/local/share/npm/bin:~/.cabal/bin:$HOME/Library/Haskell/bin:$PATH
export RBENV_ROOT=/usr/local/var/rbenv
export PATH=$PATH:/usr/local/opt/go/libexec/bin:/usr/local/MacGPG2/bin
export GOPATH=$HOME/src/gopath

# Setup terminal, and turn on colors
export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

# Enable color in grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'

# This resolves issues install the mysql, postgres, and other gems with native non universal binary extensions
export ARCHFLAGS='-arch x86_64'

export LESS='--ignore-case --raw-control-chars'
export PAGER='most'
export EDITOR='vim'
# CTAGS Sorting in VIM/Emacs is better behaved with this in place
export LC_COLLATE=C
export HOMEBREW_GITHUB_API_TOKEN=$(cat ~/.gh_api_token)
export HOMEBREW_NO_ANALYTICS=1
# Silence direnv
export DIRENV_LOG_FORMAT=
