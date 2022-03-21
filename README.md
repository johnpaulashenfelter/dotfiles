# John Paul Ashenfelter dotfiles

These are config files to set up an OSX system the way I like it. Sources and inspiration in a somewhat historical order:

* the inestimable Ryan Bates dotfiles (https://github.com/ryanb/dotfiles)
* https://github.com/holman/dotfiles particularly for the better way to deal with symlinking and other setup tasks
* ThoughtBot's `rcm` https://thoughtbot.com/blog/rcm-for-rc-files-in-dotfiles-repos
* The new, sexy `chezmoi` which replaces `rcm` for 2022

Some of the features include

* custom prompt using rbenv/asdf and git to display details
* common rails aliases
* ssh config file
* development defaults
* Tab completion is  added to `git`, `rake` and `cap` commands:

```
  rake db:mi<tab>
  cap de<tab>
  git co feature<tab>
```

## Prereqs

Assuming a recent OSX machine, `git`, `ruby`, and `curl` should be installed and ready. Much of this will also work for Linux with the clear exception of homebrew.

## Installation
```
sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply johnpaulashenfelter
```

This should install all the key applications from homebrew and the Mac App Store as well as handle a lot of custom configuration.

## Post-installation reminders

* `mkdir craft me work`
* Sign in to Dropbox and sync
* ~Open iTerm, Preferences > General > Load...from custom file `~/Dropbox/settings/com.googlecode.iterm2.plist`~
* Open Terminal and import the preferences from `iCloud Drive/TBD`
* Open Alfred, Advanced > Sync ~`~/Dropbox/settings/Alfred`~`iCloud Drive/TBD`; Also add the licensefile from 1password
* Open Dash, General > Syncing ~`~/Dropbox/settings/Dash`~`iCloud Drive/TBD`; Also add the licensefile from 1password
* Create a new ssh key for GitHub/etc
  - ssh-keygen -t rsa -b 4096 -C "john@ashenfelter.com"
  - ssh-add -K ~/.ssh/id_rsa

Preference Panes

https://github.com/Lord-Kamina/SwiftDefaultApps/tree/v2.0.1
https://www.bresink.com/osx/TinkerTool.html
