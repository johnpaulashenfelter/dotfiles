# Bash

## Options
export HISTFILESIZE=5000
export EDITOR="subl -n -w"
export GREP_OPTIONS="--color=auto" GREP_COLOR="1;32"
# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

## Paths
export GOPATH="/Users/johnpaul/.go"
export NODE_PATH="/usr/local/share/npm/lib/node_modules"
export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

if [ -d ~/bin ]; then
  export PATH=~/bin:$PATH  # add your bin folder to the path, if you have it.  It"s a good place to add all your scripts
fi

## Aliases
### Easier navigation
alias ..="cd .."
alias ...="cd ../.."
### Easier listing
alias ls="ls -GF" # always colorize and indicate type/executable
# List all files colorized in long format, including dot files with filesize suffixes
alias la="ls -ahl"
alias l="clear && pwd && ls -FGl"
alias u="cd .. && l"
### Shorthand
alias c="clear"
alias df="df -h"
alias ducks="du -cksh * | sort -rn|head -11" # Lists folders and files sizes in the current folder
alias f="find . -iname"
alias h?="history | grep"
alias m="more"
alias p="ps xa | grep "
# Shows most used commands, cool script I got this from: http://lifehacker.com/software/how-to/turbocharge-your-terminal-274317.php
alias profileme="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"
alias psgrep="ps aux | grep"
alias reload=". ~/.bash_profile"
alias rsync="rsync -avz"
alias space="du -shc * .[^.]*"
alias systail="tail -f /var/log/system.log"
alias tlf="tail -f"
alias topc="top -o cpu"

# OSX
# Add tab completion for `defaults read|write NSGlobalDomain`
# Could just use `-g` instead, but being explicit
complete -W "NSGlobalDomain" defaults
# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

## Aliases
alias clean_term_logs="sudo rm -rf /private/var/log/asl/*.asl"
## Flush Directory Service cache
alias flush="sudo killall -HUP mDNSResponder" # OSX 10.7 - 10.8
## Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"
## View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

## Homebrew
alias brupdate='brew update && brew outdated'
# EC2 tools
# export JAVA_HOME="$(/usr/libexec/java_home)"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

if [ -d /usr/local/share/npm/bin ]; then
  export PATH=/usr/local/share/npm/bin:$PATH
fi

if [ -f `brew --prefix`/etc/autojump.sh ]; then
  . `brew --prefix`/etc/autojump.sh
fi

if [ -d /usr/local/bin ]; then
  export PATH=/usr/local/bin:$PATH
fi

# Development
alias editcommit="git commit --amend -m"
alias h="heroku"
alias s.="subl ."

# Cool trick from Thoughtbot Botcave, http://tinyletter.com/thoughtbot/letters/the-bot-cave-august-and-september-2013
# Add only the current project's bin to our shell's PATH via export PATH=".git/safe/../../bin:$PATH" and mkdir .git/safe.
# mkdir .git/safe in the root of repositories you trust
export PATH=".git/safe/../../bin:$PATH"

## Ruby
if which rbenv &>/dev/null ; then
  eval "$(rbenv init - --no-rehash)"
fi
# https://gist.github.com/csfrancis/ae59547804aedb82016d
export RUBY_GC_OLDMALLOC_LIMIT=128000000
export RUBY_GC_MALLOC_LIMIT=128000000
export RUBY_GC_HEAP_SLOTS_GROWTH_FACTOR=1.25
export RUBY_GC_HEAP_GROWTH_MAX_SLOTS=300000
export RUBY_GC_HEAP_INIT_SLOTS=1600000
export RUBY_GC_HEAP_FREE_SLOTS=600000
export RUBY_GC_HEAP_OLDOBJECT_LIMIT_FACTOR=1.3

## Rails
alias b="bundle exec"
alias cov='/usr/bin/open -a "/Applications/Google Chrome.app" coverage/index.html'
# http://geekystuff.net/2009/01/14/remove-all-ruby-gems/
alias gemclear='gem list | cut -d" " -f1 | xargs gem uninstall -aIx'
alias migrate="rake db:migrate && rake db:test:prepare"
alias rst="touch tmp/restart.txt" #passenger/pow restart
# https://coderwall.com/p/vyl8zg
alias standup="clear && git log --since '2 days ago' --no-merges --author 'johnpaul'"
alias tlog="tail -f log/development.log"
# Quickly find the big files in a rails app
function heftiest {
  for file in $(find app/$1/**/*.rb -type f); do wc -l $file ; done  | sort -r | head
}

## Python
# pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# To use Homebrew's directories rather than ~/.pyenv add to your profile:
# export PYENV_ROOT=/usr/local/opt/pyenv

## Go
# export PATH=$PATH:/usr/local/opt/go/libexec/bin

# highlingint from https://gist.github.com/jimbojsb/1630790
# function light() {
#   if [ -z "$2" ]
#     then src="pbpaste"
#   else
#     src="cat $2"
#   fi
#   $src | highlight -O rtf --syntax $1 --font Inconsolata --style solarized-dark --font-size 24 | pbcopy
# }
