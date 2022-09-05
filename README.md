# John Paul Ashenfelter dotfiles

These are config files to set up an OSX system the way I like it. Sources and inspiration in a somewhat historical order:

* the inestimable Ryan Bates dotfiles (https://github.com/ryanb/dotfiles)
* https://github.com/holman/dotfiles particularly for the better way to deal with symlinking and other setup tasks
* ThoughtBot's `rcm` https://thoughtbot.com/blog/rcm-for-rc-files-in-dotfiles-repos
* The new, sexy `chezmoi` which replaces `rcm` for 2022

## Pre-installation reminders

- Sign into App Store *before* starting `chezmoi` so `mas` can install App Store software properly


## Installation
```
sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply johnpaulashenfelter
```

This should install all the key applications from homebrew and the Mac App Store as well as handle a lot of custom configuration.

## Post-installation security setup
- https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account
- https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key

## Post-installation application setup

* Open Alfred, Advanced > Sync 
* Open Dash, General > Syncing 
* Sign in to Dropbox and sync

