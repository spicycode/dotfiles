fpath=($fpath "/Users/spicycode/.zfunctions")
source ~/.zsh/colors.zsh
source ~/.zsh/setopt.zsh
source ~/.zsh/exports.zsh
source ~/.zsh/prompt.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/bindkeys.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/history.zsh
source ~/.zsh/zsh_hooks.zsh

# External files to source

# Setup GRC for auto colors
if [ -d "/opt/homebrew" ]; then
  export HOMEBREW_PATH="/opt/homebrew"
  source /opt/homebrew/etc/grc.zsh
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source /opt/homebrew/opt/asdf/asdf.sh
else
  source /usr/local/etc/grc.zsh
  source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source /usr/local/opt/asdf/asdf.sh
fi

source $HOME/.cargo/env

precmd() {
  if [[ -n "$TMUX" ]]; then
    tmux setenv "$(tmux display -p 'TMUX_PWD_#D')" "$PWD"
  fi
}
