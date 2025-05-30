function zsh_recompile {
  autoload -U compinit
  rm -f ~/.zcompdump*
  compinit t

  autoload -U zrecompile
  rm -f ~/.zsh/*.zwc
  rm -f ~/.zsh*zwc
  [[ -f ~/.zshrc ]] && zrecompile -p ~/.zshrc
  [[ -f ~/.zshrc.zwc.old ]] && rm -f ~/.zshrc.zwc.old

  for f in ~/.zsh/**/*.zsh; do
    [[ -f $f ]] && zrecompile -p $f
    [[ -f $f.zwc.old ]] && rm -f $f.zwc.old
  done

  [[ -f ~/.zcompdump ]] && zrecompile -p ~/.zcompdump
  [[ -f ~/.zcompdump.zwc.old ]] && rm -f ~/.zcompdump.zwc.old

  source ~/.zshrc
}

function extract {
  echo Extracting $1 ...
  if [ -f $1 ]; then
    case $1 in
    *.tar.bz2) tar xjf $1 ;;
    *.tar.gz) tar xzf $1 ;;
    *.bz2) bunzip2 $1 ;;
    *.rar) unrar x $1 ;;
    *.gz) gunzip $1 ;;
    *.tar) tar xf $1 ;;
    *.tbz2) tar xjf $1 ;;
    *.tgz) tar xzf $1 ;;
    *.zip) unzip $1 ;;
    *.Z) uncompress $1 ;;
    *.7z) 7z x $1 ;;
    *) echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

function ss {
  if [ -e script/server ]; then
    script/server $@
  elif [ -e mix.exs ]; then
    iex -S mix phx.server $@
  else
    bin/rails server $@
  fi
}

function sc {
  if [ -e mix.exs ]; then
    iex -S mix
  elif [ -e script/console ]; then
    script/console $@
  else
    script/rails console $@
  fi
}

# Something is weird on work computer land with the agent
function ssh_boot() {
  eval $(ssh-agent)
  ssh-add -k
}

function icloud_drive() {
  cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/
}

# From https://github.com/junegunn/fzf-git.sh
# git checkout powered by fzf-git
function gco() {
  local selected=$(_fzf_git_each_ref --no-multi)
  [ -n "$selected" ] && git checkout "$selected"
}

# git worktree switch powered by fzf-git
function gswt() {
  cd "$(_fzf_git_worktrees --no-multi)"
}
