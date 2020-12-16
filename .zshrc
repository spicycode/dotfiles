export HOMEBREW_PATH="$(brew --prefix)"
source ~/.zsh/colors.zsh
source ~/.zsh/setopt.zsh
source ~/.zsh/exports.zsh
source ~/.zsh/prompt.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/bindkeys.zsh
source ~/.zsh/functions.zsh
if [ ! -d "/opt/homebrew" ]; then
  source ~/.zsh/fzf.zsh
fi
source ~/.zsh/history.zsh
source ~/.zsh/zsh_hooks.zsh

# Setup GRC for auto colors
source $HOMEBREW_PATH/etc/grc.zsh

# Setup rbenv autocomplete
# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

precmd() {
  if [[ -n "$TMUX" ]]; then
    tmux setenv "$(tmux display -p 'TMUX_PWD_#D')" "$PWD"
  fi
}

source $HOMEBREW_PATH/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source $HOMEBREW_PATH/opt/asdf/asdf.sh
fpath=($fpath "/Users/spicycode/.zfunctions")

source $HOME/.cargo/env
fpath=($fpath "/Users/spicycode/.zfunctions")
