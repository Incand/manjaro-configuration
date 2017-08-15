#!/bin/bash

echo "Installing pacaur-deps..."
for $dep in $(cat pacaur-deps.txt); do
	pacaur --needed -S "$dep";
done

echo "Configuring alsa..."
sudo cp 50-alsa.conf /etc/modprobe.d/

echo "Calling configure in subdirs..."
for conf in */configure.sh; do
	echo "$conf";
done
