#!/bin/bash

echo "Installing pacaur dependencies..."
for dep in `cat pacaur-deps.txt`; do
	echo "$dep";
	pacaur --needed -S "$dep";
done

echo "Install python dependencies..."
sudo pip install -r pip-deps.txt

echo "Copying i3 config structure..."
cp -r .config ~/

[ -d ~/.i3 ] || { echo "Removing old i3 config directory..."; rm -r ~/.i3; }

echo "Done."
