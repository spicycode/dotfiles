function zsh_recompile {
  autoload -U zrecompile
  rm -f ~/.zsh/*.zwc
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
  if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)   tar xjf $1  ;;
          *.tar.gz)    tar xzf $1  ;;
          *.bz2)       bunzip2 $1  ;;
          *.rar)       unrar x $1    ;;
          *.gz)        gunzip $1   ;;
          *.tar)       tar xf $1   ;;
          *.tbz2)      tar xjf $1  ;;
          *.tgz)       tar xzf $1  ;;
          *.zip)       unzip $1   ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1  ;;
          *)        echo "'$1' cannot be extracted via extract()" ;;
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

function trash () {
  local path
  for path in "$@"; do
    # ignore any arguments
    if [[ "$path" = -* ]]; then :
    else
      local dst=${path##*/}
      # append the time if necessary
      while [ -e ~/.Trash/"$dst" ]; do
        dst="$dst "$(date +%H-%M-%S)
      done
      /bin/mv "$path" ~/.Trash/"$dst"
    fi
  done
}


function add_keys() {
  ssh-add -k
}

function homebrew() {
  brew update && brew outdated && brew upgrade 
}

function update_software() {
  echo "==> Upgrading gh extensions"
  gh extension upgrade --all
  echo ""

  echo "==> Upgrading asdf plugins"
  asdf plugin-update --all
  echo ""

  echo "==> Upgrading homebrew"
  homebrew
  echo ""
}

function mpb_reboot_av() {
  # Restart CoreAudio because 👎
  sudo killall coreaudiod

  # Restart webcam process
  sudo killall VDCAssistant

  # Restart control strip because 🔥
  killall ControlStrip
}

function icloud_drive() {
  cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/
}

function pg_start() {
  pg_ctl -D /opt/homebrew/var/postgres start
}

function pg_stop() {
  pg_ctl -D /opt/homebrew/var/postgres stop
}

# Stolen from @rosston!
function coauth() {
  printf "Co-authored-by: %s" "$(git log --pretty=format:"%an <%ae>" -5000 | awk '!visited[$0]++' | fzf --border=rounded)" | pbcopy
}

# From https://github.com/junegunn/fzf-git.sh
function gco() {
  local selected=$(_fzf_git_each_ref --no-multi)
  [ -n "$selected" ] && git checkout "$selected"
}
