#!/bin/bash
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

ln -s ~/.vim/vimrc ~/.vimrc

vim +BundleInstall +qall
cd bundle/vimproc.vim/ && make && cd -
