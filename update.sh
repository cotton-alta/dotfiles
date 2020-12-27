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
ln -si $dst/.bash_profile $HOME/_bash_profile || echo "skipped"

echo "Overwrite Syntax..."
cp -ri $dst/after $HOME/.vim
