#!/usr/bin/env bash

# Change to the source path where we store the Brewfile
cd "$(chezmoi source-path)"

# Dump a new temporary Brewfile
brew bundle dump --describe --no-restart --force --file=Brewfile.tmp

# Compare with Deltawalker
/Applications/DeltaWalker.app/Contents/MacOS/DeltaWalker Brewfile Brewfile.tmp

# Cleanup temporary file
rm Brewfile.tmp
