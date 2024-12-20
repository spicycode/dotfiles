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

# OPAM
[[ ! -r ~/.opam/opam-init/init.zsh ]] || source ~/.opam/opam-init/init.zsh >/dev/null 2>/dev/null

[[ ! -r ~/.github_pat ]] || source ~/.github_pat >/dev/null 2>/dev/null

# eval fzf
source <(fzf --zsh)

if [[ $ZSH_BIZ_TIME == true ]]; then
  # Work config does an ultra naive approach to appending, and just repeatedly stacks these over and over at the end of the file.
  # TODO: Completely separate `zshrc` for work to be friendly to work's approach, this is too sophesticated.
  export PKG_CONFIG_PATH="/opt/homebrew/opt/zlib/lib/pkgconfig:/usr/local/opt/zlib/lib/pkgconfig:$PKG_CONFIG_PATH"
  export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@3/lib/pkgconfig:/usr/local/opt/openssl@3/lib/pkgconfig:$PKG_CONFIG_PATH"
  eval "$(rbenv init -)"
  export RACK_ENV=development
  eval "$(mise activate zsh)"
  export AWS_CONFIG_FILE="$HOME/figma/figma/config/aws/sso_config"
  export SSH_AUTH_SOCK=~/.ssh/ssh-agent.$HOSTNAME.sock
  ssh-add -l 2>/dev/null >/dev/null
  if [ $? -ge 2 ]; then
    ssh-agent -a "$SSH_AUTH_SOCK" >/dev/null
  fi
else
  source /opt/homebrew/opt/asdf/libexec/asdf.sh
fi
