#!/bin/sh

# Basing off of https://github.com/dcreager/dotfiles/blob/main/install

cd $HOME

# Run symlink of all files

# Remove oh-my configs if present
rm -rf .oh-my-bash
rm -rf .oh-my-zsh
# rm .zshrc

# I'd like to use zsh, please
# apt-get install -y zsh
# chsh -s /usr/bin/zsh

echo "Installing fzf 0.29.0"
curl -L https://github.com/junegunn/fzf/releases/download/0.29.0/fzf-0.29.0-linux_amd64.tar.gz  | tar xzC $HOME/bin

echo "Installing neovim 0.6.1"
apt-get install -y libfuse2
curl -L -o $HOME/bin/nvim https://github.com/neovim/neovim/releases/download/v0.6.1/nvim.appimage
chmod a+x $HOME/bin/nvim
