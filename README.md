# John Paul Ashenfelter dotfiles

These are config files to set up a system the way I like it. Originally a lot was copied from Ryan Bates dotfiles (https://github.com/ryanb/dotfiles), but there have been substantial adjustments made over the past couple years, most recently based on https://github.com/holman/dotfiles particularly for the better way to deal with symlinking and other setup tasks


# Installation

  * git clone git@github.com:johnpaulashenfelter/dotfiles.git
  * `brew bundle`
  * OPTIONAL: `brew bundle Brewfile.dev`
  * `rcup -v` (Using https://github.com/thoughtbot/rcm)


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
