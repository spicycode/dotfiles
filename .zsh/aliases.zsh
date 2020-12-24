# Colorize output, add file type indicator, and put sizes in human readable format
alias ls='ls -GFh'

# Same as above, but in long listing format
alias ll='ls -GFhl'

# TODO: Consider converting to `gh` at some point
alias git='hub'

if [ ! -d "/opt/homebrew" ]; then
  alias vim='nvim'
fi
