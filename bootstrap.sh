#!/bin/bash

# DO NOT USE. WIP.

set -e

function ensure_link {
    test -L "$HOME/$2" || ln -s "$HOME/$1" "$HOME/$2"
}

echo

# Atom editor
echo ATOM EDITOR
echo
echo "configuring symlink..."
ensure_link "src/dotfiles/.atom" ".atom"
echo "done"
echo

echo "installing packages..."
apm install --packages-file .atom/packages.txt
echo "done"
echo
