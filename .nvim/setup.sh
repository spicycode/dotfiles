#!/bin/bash
ln -s ~/.vim/vimrc ~/.vimrc

vim +PlugInstall +qall

cd bundle/ctrlp-cmatcher && ./install.sh && cd - 

