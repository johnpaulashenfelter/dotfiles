#!/usr/bin/env bash

# Cleanup any old update file
rm -f ~/.dotfiles/Brewfile.tmp

# Dump a new Brewfile
brew bundle dump --file=~/.dotfiles/Brewfile.tmp

# Compare with Deltawalker
/Applications/DeltaWalker.app/Contents/MacOS/DeltaWalker ~/.dotfiles/Brewfile ~/.dotfiles/Brewfile.tmp

# Cleanup temporary file
rm ~/.dotfiles/Brewfile.tmp