#!/bin/bash

echo "Installing pacaur-deps..."
for $dep in $(cat pacaur-deps.txt); do
	pacaur --needed -S "$dep";
done

echo "Calling configure in subdirs..."
for conf in */configure.sh; do
	$(
