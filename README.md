## Initial Setup
### Clone to local environment.

### Create symbolic links.
Execute update.sh. If symbolic links already exist, you will be asked whether to overwrite them - enter 'y' to overwrite.

## Role of Each File

### .vimrc
This is the Vim configuration file. It handles basic settings such as character encoding, indentation, search, cursor movement, and plugin management using NeoBundle.

### .zshrc
This is the Zsh configuration file. It includes initialization of various development environments (rbenv, goenv, nvm, direnv), plugin management with zgen, and prompt customization including Git branch display.

### Brewfile
This file manages packages to be installed via Homebrew. It allows for batch installation of CLI tools, fonts, and applications necessary for development.

### update.sh
This is an automation script for environment setup. It handles cloning dotfiles, installing zgen, installing packages from Brewfile, and creating symbolic links for various configuration files.
