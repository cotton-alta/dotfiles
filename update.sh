#!/bin/zsh

set -ue -o pipefail

dst="$HOME/dotfiles"

if [ ! -e $dst/.git ]; then
  echo "Cloning dotfiles..."
  git clone https://github.com/cotton-alta/dotfiles.git $dst
else
  echo "Updating dotfiles..."
  (cd $dst && git pull)
fi

if [ ! -e $HOME/.zgen ]; then
  echo "Cloning zgen..."
  git clone https://github.com/tarjoilija/zgen.git $HOME/.zgen
else
  echo "Updating zgen..."
  (cd $HOME/.zgen && git pull)
fi

echo "Installing packages..."
cp -i $dst/Brewfile $HOME/Brewfile
brew bundle

echo "Creating symbolic links..."
ln -fs $dst/.zshrc $HOME/.zshrc || echo "skipped"
ln -fs $dst/.vimrc $HOME/_vimrc || echo "skipped"

echo "Overwrite Syntax..."
cp -ri $dst/after $HOME/.vim

echo "Setting color schema for vim..."
cp -ri $dst/colors $HOME/.vim

echo "Setting gitconfig..."
cp -i $dst/.gitconfig $HOME/.gitconfig
cp -i $dst/.gitignore_global $HOME/.gitignore_global

echo "Setting iTerm2 config..."
ln -fs $dst/iTerm2/com.googlecode.iterm2.plist $HOME/Library/Preferences
killall cfprefsd

echo "Setting Claude config..."
mkdir -p $HOME/.claude
ln -fs $dst/CLAUDE.md $HOME/.claude/CLAUDE.md || echo "skipped"

echo "Setting Ghostty config..."
mkdir -p $HOME/.config/ghostty
ln -fs $dst/ghostty_config $HOME/.config/ghostty/config || echo "skipped"

echo "Setup is complete \U1F389"
