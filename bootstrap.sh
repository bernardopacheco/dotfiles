#!/bin/bash

# DO NOT USE. WIP.

set -e

function ensure_link {
    test -L "$HOME/$2" || ln -s "$HOME/$1" "$HOME/$2"
}

# Atom editor
echo
ensure_link "src/dotfiles/.atom" ".atom"
echo "atom editor: symlink created"
echo

apm install --packages-file .atom/packages.txt
echo "atom editor: packages installed"
echo
