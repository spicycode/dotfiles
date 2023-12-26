set -x GOPATH $HOME/src/gopath
set -e fish_user_paths # Clear any set path 
set -U fish_user_paths $HOME/.bin /opt/homebrew/sbin /opt/homebrew/bin /opt/homeberw/share/npm/bin $fish_user_paths
set -U fish_user_paths $HOME/.cargo/bin /Applications/WezTerm.app/Contents/MacOS $HOME/.config/emacs/bin $GOPATH/bin $fish_user_paths

### Config settings
set fish_greeting                                 # Supresses fish's intro message
set -x MANPAGER "nvim +Man!" # "nvim" as manpager

starship init fish | source

if status is-interactive
    # Commands to run in interactive sessions can go here
end
