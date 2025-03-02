set -x GOPATH $HOME/src/gopath

fish_add_path "/opt/homebrew/sbin"
fish_add_path --append "/opt/homebrew/bin"
fish_add_path --append ~/.cargo/bin
fish_add_path --append /Applications/WezTerm.app/Contents/MacOS
fish_add_path --append ~/.dotfiles/bin
fish_add_path --append $GOPATH/bin

### Config settings

if type -q asdf
  source /opt/homebrew/share/fish/vendor_completions.d/asdf.fish
end

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
