# Setup fzf
# ---------
if [[ ! "$PATH" == *$HOMEBREW_PATH/opt/fzf/bin* ]]; then
  export PATH="$PATH:$HOMEBREW_PATH/opt/fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == *$HOMEBREW_PATH/opt/fzf/man* && -d "$HOMEBREW_PATH/opt/fzf/man" ]]; then
  export MANPATH="$MANPATH:$HOMEBREW_PATH/opt/fzf/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$HOMEBREW_PATH/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$HOMEBREW_PATH/opt/fzf/shell/key-bindings.zsh"

# Configuration Options
# ---------------------
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --no-messages --glob '!.git/*'"
