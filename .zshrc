if [ -d "/opt/homebrew" ]; then
  export HOMEBREW_PATH="/opt/homebrew"
else
  export HOMEBREW_PATH="/usr/local"
fi

fpath=($fpath "/Users/spicycode/.zfunctions")
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

# External files to source

# Setup GRC for auto colors
source $HOMEBREW_PATH/etc/grc.zsh
source $HOMEBREW_PATH/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOMEBREW_PATH/opt/asdf/asdf.sh
source $HOME/.cargo/env

precmd() {
  if [[ -n "$TMUX" ]]; then
    tmux setenv "$(tmux display -p 'TMUX_PWD_#D')" "$PWD"
  fi
}
