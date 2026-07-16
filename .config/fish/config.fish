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

### Init stuff
starship init fish | source

if status is-interactive
    # Commands to run in interactive sessions can go here
end
