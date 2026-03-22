#!/bin/zsh

set -ue -o pipefail

dst="$HOME/src/github.com/cotton-alta/dotfiles"
if [ ! -d "$dst" ]; then
  echo "Cloning dotfiles..."
  git clone https://github.com/cotton-alta/dotfiles.git "$dst"
fi

if [ ! -e $HOME/.zgen ]; then
  echo "Cloning zgen..."
  git clone https://github.com/tarjoilija/zgen.git $HOME/.zgen
else
  echo "Updating zgen..."
  (cd $HOME/.zgen && git pull)
fi

echo "Installing packages..."
brew bundle --file=$dst/Brewfile

echo "Creating symbolic links..."
mkdir -p $HOME/.vim
mkdir -p $HOME/.claude
mkdir -p $HOME/.config/ghostty
ln -s $dst/.zshrc $HOME/.zshrc
ln -s $dst/.vimrc $HOME/_vimrc
ln -s $dst/after $HOME/.vim/after
ln -s $dst/colors $HOME/.vim/colors
ln -s $dst/.gitconfig $HOME/.gitconfig
ln -s $dst/.gitignore_global $HOME/.gitignore_global
ln -s $dst/CLAUDE.md $HOME/.claude/CLAUDE.md
ln -s $dst/ghostty_config $HOME/.config/ghostty/config

echo "Setup is complete \U1F389"
