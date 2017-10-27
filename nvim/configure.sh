#!/bin/bash

echo "Installing pacaur-deps..."
for dep in $(cat pacaur-deps.txt); do
	pacaur --needed -S "$dep";
done

if [[ ! -d ~/.vim/bundle ]]; then
    echo "Getting Vundle..."
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

echo "Installing Vundle plugins..."
nvim +PluginInstall +qall

if [[ ! -d ~/.local/share/nvim/plugged ]]; then
    echo "Gettung vimplug..."
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo "Installing vim-plug plugins..."
nvim +PlugInstall +qall

echo "Copying init.vim..."
cp -r ./init* ~/.config/nvim/
