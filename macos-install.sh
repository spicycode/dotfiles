echo "Setting up spicycode/dotfiles"

if [ ! -f "`which brew`" ]; then 
  echo "homebrew not installed, run strap first."
else
  brew bundle
  luarocks install --server=https://luarocks.org/dev luaformatter
fi

source ./perform_default_writes.sh
