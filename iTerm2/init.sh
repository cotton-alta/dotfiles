#!/usr/bin/env bash

set -ue -o pipefail

dst="$HOME/dotfiles"

ln -fs $dst/iTerm2/com.googlecode.iterm2.plist $HOME/Library/Preferences

killall cfprefsd