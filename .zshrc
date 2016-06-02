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
source ~/src/zaw/zaw.zsh

# Setup direnv
eval "$(direnv hook zsh)"

# Setup rbenv autocomplete
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Enable autocomplete and shims for node
if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi

precmd() {
  if [[ -n "$TMUX" ]]; then
    tmux setenv "$(tmux display -p 'TMUX_PWD_#D')" "$PWD"
  fi
}

