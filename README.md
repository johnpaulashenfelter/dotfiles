# John Paul Ashenfelter dotfiles

These are config files to set up an OSX system the way I like it. Sources and inspiration in a somewhat historical order:

* the inestimable Ryan Bates dotfiles (https://github.com/ryanb/dotfiles)
* https://github.com/holman/dotfiles particularly for the better way to deal with symlinking and other setup tasks
* ThoughtBot's `rcm` https://thoughtbot.com/blog/rcm-for-rc-files-in-dotfiles-repos

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

* `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
* `git clone https://github.com/johnpaulashenfelter/dotfiles.git .dotfiles`
* `brew bundle --file=.dotfiles/Brewfile`
* `rcup -v`

This should install all the key applications from homebrew and the Mac App Store as well as handle a lot of custom configuration.

## Post-installation reminders

* `mkdir craft me work`
* Sign in to Dropbox and sync `family/apps settings tpoint/apps`
* Open iTerm, Preferences > General > Load...from custom file `~/Dropbox/settings/com.googlecode.iterm2.plist`
* Open Alfred, Advanced > Sync `~/Dropbox/settings/Alfred`; Also add the licensefile from 1password
* Open Dash, General > Syncing `~/Dropbox/settings/Dash`; Also add the licensefile from 1password
* Create a new ssh key for GitHub/etc
  - ssh-keygen -t rsa -b 4096 -C "john@ashenfelter.com"
  - ssh-add -K ~/.ssh/id_rsa

https://github.com/lemnos/theme.sh
  sudo curl -o /usr/local/bin/theme.sh 'https://raw.githubusercontent.com/lemnos/theme.sh/master/theme.sh' && sudo chmod +x /usr/local/bin/theme.sh


Preference Panes

https://github.com/Lord-Kamina/SwiftDefaultApps/tree/v2.0.1
https://www.bresink.com/osx/TinkerTool.html
