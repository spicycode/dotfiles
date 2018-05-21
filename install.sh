echo "Setting up spicycode/dotfiles"

if [ ! -f "`which brew`" ]; then 
  echo "homebrew not installed, run strap first."
else
  brew bundle
  echo "Installing prompts for ZSH"
  npm install --global pure-prompt
  npm install --global spaceship-prompt
fi

source ./setup_launchbar_extras.sh
