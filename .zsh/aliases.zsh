# Colorize output, add file type indicator, and put sizes in human readable format
alias ls='ls -GFh'

# Same as above, but in long listing format
alias ll='ls -GFhl'


if [ ! -d "/opt/homebrew" ]; then
  alias git='hub'
  alias vim='nvim'
fi
