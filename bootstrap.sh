# DO NOT USE. WIP.

# Atom editor
echo
ln -s ~/src/dotfiles/.atom ~/.atom
echo "atom editor: symlink created"
echo

apm install --packages-file .atom/packages.txt
echo "atom editor: packages installed"
echo
