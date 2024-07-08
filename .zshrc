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
source ~/.zsh/fzf-git.sh

# External files to source
source /opt/homebrew/etc/grc.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/opt/asdf/libexec/asdf.sh
source $HOME/.cargo/env

# OPAM
[[ ! -r /Users/chad/.opam/opam-init/init.zsh ]] || source /Users/chad/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# eval fzf
eval "$(fzf --zsh)"
