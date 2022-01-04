dst="$HOME/dotfiles"

if [ ! -e $dst/.git ]; then
  echo "Cloning dotfiles..."
  git clone https://github.com/cotton-alta/dotfiles.git $dst
else
  echo "Updating dotfiles..."
  (cd $dst && git pull)
fi

echo "Creating symbolic links..."
ln -si $dst/.vimrc $HOME/_vimrc || echo "skipped"

echo "Overwrite Syntax..."
cp -ri $dst/after $HOME/.vim

echo "Setting color schema for vim..."
cp -ri $dst/colors $HOME/.vim

echo "Setting gitconfig..."
cp -i $dst/.gitconfig $HOME/.gitconfig
cp -i $dst/.gitignore_global $HOME/.gitignore_global
