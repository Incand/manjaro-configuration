#!/bin/sh

for dep in $(cat pacaur-deps.txt); do
	pacaur --needed -S "$dep";
done

# Make .zsh directory if it doesn't exist already and change into it
mkdir ~/.zsh > /dev/null 2>&1
cd ~/.zsh

# Delete everything in here
rm -rf *

# Get custom configs
git clone https://github.com/Incand/oh-my-zsh.git oh-my-zsh
git clone https://github.com/daniel451/zsh-syntax-highlighting.git zsh-syntax-highlighting
git clone https://github.com/daniel451/zsh-autosuggestions.git oh-my-zsh/custom/plugins/zsh-autosuggestions

# Overwrite .zshrc with personal template
cp oh-my-zsh/templates/zshrc-Incand ~/.zshrc

# Change and spawn shell
chsh -s /bin/zsh
zsh
