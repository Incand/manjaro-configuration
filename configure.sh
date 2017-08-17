#!/bin/bash

echo "Installing pacaur..."
sudo pacman --needed -S pacaur

echo "Installing pacaur-deps..."
for dep in $(cat pacaur-deps.txt); do
	pacaur --needed -S "$dep";
done

echo "Configuring alsa..."
sudo cp 50-alsa.conf /etc/modprobe.d/

echo "Configuring profile..."
sudo cp profile /etc/profile

echo "Configuring udisks2 with udiskie..."
sudo cp 99-udisks2.rules /etc/udev/rules.d/
cp .xinitrc ~/

echo "Configuring makepkg..."
sudo cp makepkg.conf /etc/makepkg.conf

echo "Calling configure in subdirs..."
for conf in */configure.sh; do
	$conf;
done

qtconfig-qt4 &
