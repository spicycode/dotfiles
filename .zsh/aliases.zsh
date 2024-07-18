# Colorize output, add file type indicator, and put sizes in human readable format

if [[ $ZSH_BIZ_TIME == true ]]; then
  # exa isn't trusted at work
  alias ls='ls -GFh --color'
  alias ll='ls -GFhl --color'
else
  alias ls='eza --group-directories-first'
  alias ll='eza --group-directories-first -l --git'
fi

alias vim='nvim'
