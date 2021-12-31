#!/usr/bin/env bash

# Dump a new Brewfile
brew bundle dump --describe --no-restart --force --file=Brewfile.tmp

# Compare with Deltawalker
/Applications/DeltaWalker.app/Contents/MacOS/DeltaWalker Brewfile Brewfile.tmp

# Cleanup temporary file
rm Brewfile.tmp
