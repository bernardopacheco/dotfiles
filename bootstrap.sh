#!/bin/bash

# DO NOT USE. WIP.

set -e

function ensure_link {
    test -e "$HOME/$2" && rm -rf "$HOME/$2"
    ln -s "$HOME/$1" "$HOME/$2"
}

mkdir -p ~/local/bin
cp bin/* ~/local/bin
chmod u+rwx,go+r-wx ~/local/bin/*

ensure_link "src/dotfiles/vim/.vimrc" ".vimrc"
ensure_link "src/dotfiles/fish/config.fish" ".config/fish/config.fish"
ensure_link "src/dotfiles/git/.gitconfig" ".gitconfig"
ensure_link "src/dotfiles/git/.gitignore" ".gitignore"
