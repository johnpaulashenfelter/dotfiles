#!/usr/bin/env bash

brew bundle dump --file=~/.dotfiles/Brewfile.update
/Applications/DeltaWalker.app/Contents/MacOS/DeltaWalker ~/.dotfiles/Brewfile ~/.dotfiles/Brewfile.update
rm Brewfile.update