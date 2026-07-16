set -x GOPATH $HOME/src/gopath

fish_add_path --append ~/.dotfiles/bin
fish_add_path --append $GOPATH/bin

### Config settings

if type -q nvim
  set -gx EDITOR 'nvim'
end

## Suppresses fish's intro message
set fish_greeting

# "nvim" as manpager
set -x MANPAGER "nvim +Man!"

### Init starship prompt
starship init fish | source

if status is-interactive
    # Commands to run in interactive sessions can go here
    abbr -a ls 'eza --group-directories-first'
    abbr -a ll 'eza -la --git --group-directories-first'
    abbr -a tree 'eza --tree'

    fish_config theme choose catppuccin-mocha
end
