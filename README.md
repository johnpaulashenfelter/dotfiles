# John Paul Ashenfelter dotfiles

These are config files to set up a system the way I like it. Originally a lot was copied from Ryan Bates dotfiles (https://github.com/ryanb/dotfiles), but there have been substantial adjustments made over the past couple years, most recently based on https://github.com/holman/dotfiles particularly for the better way to deal with symlinking and other setup tasks

# Setup

## Pre

Install 1password from the App Store

## Installation

  * `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
  * `git clone git@github.com:johnpaulashenfelter/dotfiles.git .dotfiles`
  * `brew bundle --file=.dotfiles/Brewfile`
  * OPTIONAL: `brew bundle --file=.dotfiles/Brewfile.dev`
  * `rcup -v` (Using https://github.com/thoughtbot/rcm)

Once Dropbox is installed, use Authy and 1password to authenticate

## Post

 * `mkdir craft work`
 * Sign in to dropbox and sync `family/apps settings tpoint/apps transitionpoint/technical/apps`
 * Open iterm, Preferences > General > Load...from custom file `~/Dropbox/settings/com.googlecode.iterm2.plist`
 * Open Alfred, Advanced > Sync `~/Dropbox/settings/Alfred`
 * Open Dash, General > Syncing `~/Dropbox/settings/Dash`


# Environment

MacOSX using the default bash shell

# Features

* Tab completion is also added to git, rake and cap commands:

  rake db:mi<tab>
  cap de<tab>
  git co feature<tab>

* custom prompt using rbenv and git to display details
* common rails aliases
* ssh keys for syncing between machines
* ssl config file
* development defaults

## Homebrew

Most installed services, tools, and applications are installed using `brew bundle` and
the corresponding Brewfiles that are available in the repo.

## Other setup

### Sublime
$ cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
$ ln -s /Users/johnpaul/Dropbox/settings/sublime/User/
