# Atom editor
echo \n
ln -s ~/src/dotfiles/.atom ~/.atom
echo "atom editor: symlink created"
echo \n

apm install --packages-file .atom/packages.txt
echo "atom editor: packages installed"
echo \n
