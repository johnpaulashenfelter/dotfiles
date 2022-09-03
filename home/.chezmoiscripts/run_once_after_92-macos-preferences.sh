#!/usr/bin/env bash

# ~/.macos — https://mths.be/macos
# https://github.com/narze/dotfiles/blob/master/chezmoi/.chezmoiscripts/run_once_after_98-macos-preferences.sh
# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do
  sudo -n true
  sleep 60
  kill -0 "$$" || exit
done 2>/dev/null &


# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Cleanup preinstalled Dock icons
for dockItemLabel in \
  Launchpad \
  Mail \
  FaceTime \
  Messages \
  Maps \
  Photos \
  Contacts \
  Reminders \
  Notes \
  Music \
  Podcasts \
  TV \
  News \
  Numbers \
  Keynote \
  Pages \
  "App Store" \
  "System Preferences" ; do
  dockutil --find "$dockItemLabel" >/dev/null && dockutil --no-restart --remove "$dockItemLabel"
done

killall Dock
echo "Done. Note that some of these changes require a logout/restart to take effect."
