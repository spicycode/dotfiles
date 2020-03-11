if type -q asdf
  source (brew --prefix asdf)/asdf.fish
end

if type -q fzf && type -q rg
  set -gx FZF_DEFAULT_COMMAND 'rg --files'
end

if type -q nvim
  set -gx EDITOR 'nvim'
end

set -U fish_user_paths $fish_user_paths ~/.bin


# fisher setup
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end
