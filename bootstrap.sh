#!/bin/bash

set -e

function ensure_link {
    test -e "$HOME/$2" && rm -rf "$HOME/$2"
    ln -s "$HOME/$1" "$HOME/$2"
}

function install_pathogen_plugin {
    test -e "$HOME/.vim/bundle/$2" || git clone "$1" "$HOME/.vim/bundle/$2"
}

# User's executables
mkdir -p ~/local/bin
cp bin/* ~/local/bin
chmod 744 ~/local/bin/*

# Mercurial prompt
mkdir -p ~/lib/hg-prompt
cp mercurial/prompt.py ~/lib/hg-prompt
chmod 744 ~/lib/hg-prompt/prompt.py

# Create the vim file type plugin folder
mkdir -p ~/.vim/ftplugin

# Create symlinks
ensure_link "src/dotfiles/vim/.vimrc" ".vimrc"
ensure_link "src/dotfiles/vim/ftplugin/javascript.vim" ".vim/ftplugin/javascript.vim"
ensure_link "src/dotfiles/fish/config.fish" ".config/fish/config.fish"
ensure_link "src/dotfiles/git/.gitconfig" ".gitconfig"
ensure_link "src/dotfiles/git/.gitignore" ".gitignore"
ensure_link "src/dotfiles/mercurial/.hgrc" ".hgrc"
ensure_link "src/dotfiles/mercurial/.hgignore" ".hgignore"

# Install vim pathogen
# https://github.com/tpope/vim-pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle
test -e ~/.vim/autoload/pathogen.vim || curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Install vim plugins
install_pathogen_plugin "https://github.com/sjl/badwolf.git" "badwolf"
install_pathogen_plugin "https://github.com/nanotech/jellybeans.vim.git" "jellybeans"
install_pathogen_plugin "https://github.com/kien/ctrlp.vim.git" "ctrlp"
install_pathogen_plugin "https://github.com/groenewege/vim-less.git" "vim-less"
install_pathogen_plugin "https://github.com/vim-airline/vim-airline.git" "vim-airline"
