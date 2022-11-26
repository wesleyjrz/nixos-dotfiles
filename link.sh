#!/bin/sh

set -e
dir=$(pwd)

# Hardlink all configurations to `/etc/nixos`
for configs in "$dir"/*.nix ; do
	sudo ln -s "$configs" /etc/nixos ; echo "link.sh: ${configs} successfully linked"
done
