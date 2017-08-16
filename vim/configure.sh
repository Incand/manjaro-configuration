#!/bin/bash

echo "Installing pacaur-deps..."
for dep in $(cat pacaur-deps.txt); do
	pacaur --needed -S "$dep";
done

if [[ ! -d ~/.vim/bundle ]]; then
    echo "Getting vundle..."
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

echo "Copying vimrc..."
cp .vimrc ~/

echo "Installing vim plugins..."
vim +PluginInstall +qall

echo "Preparing ycm build..."
cd ~
mkdir ycm_build
cd ycm_build

cmake -G "Unix Makefiles" -DUSE_SYSTEM_LIBCLANG=ON . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp

echo "Building ycm..."
cmake --build . --target ycm_core
