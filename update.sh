#!/bin/zsh

set -ue -o pipefail

dst="$(ghq root)/github.com/cotton-alta/dotfiles"
if [ ! -d "$dst" ]; then
  echo "Cloning dotfiles..."
  ghq get https://github.com/cotton-alta/dotfiles.git
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

symlink() {
  if [ -e "$2" ] || [ -L "$2" ]; then
    echo "Skipping (already exists): $2"
  else
    ln -s "$1" "$2"
  fi
}

symlink $dst/.zshrc $HOME/.zshrc
symlink $dst/.vimrc $HOME/_vimrc
symlink $dst/after $HOME/.vim/after
symlink $dst/colors $HOME/.vim/colors
symlink $dst/.gitconfig $HOME/.gitconfig
symlink $dst/.gitignore_global $HOME/.gitignore_global
symlink $dst/CLAUDE.md $HOME/.claude/CLAUDE.md
symlink $dst/ghostty_config $HOME/.config/ghostty/config

echo "Setup is complete \U1F389"
