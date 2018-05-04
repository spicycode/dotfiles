echo "Setting up spicycode/dotfiles"

if [ ! -f "`which brew`" ]; then 
  echo "homebrew not installed, run strap first."
else
  brew bundle
  echo "Installing pure-prompt for ZSH"
  npm install --global pure-prompt
fi

source ./setup_launchbar_extras.sh
