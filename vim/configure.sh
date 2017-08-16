#!/bin/bash

echo "Getting vundle..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Copying vimrc..."
cp .vimrc ~/

echo "Installing vim plugins..."
vim +PluginInstall +qall
