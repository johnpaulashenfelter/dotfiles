## Aliases

# Easier navigation
alias ..="cd .."
alias ...="cd ../.."

alias c="clear"
alias nuke="rm -rf"
# from http://viget.com/extend/level-up-your-shell-game
alias s.="subl ."
alias editcommit="git commit --amend -m"
alias psgrep="ps aux | grep"
alias cov='/usr/bin/open -a "/Applications/Google Chrome.app" coverage/index.html'
alias h?="history | grep"

alias reload=". ~/.bash_profile"

alias ls="ls -GF" # always colorize and indicate type/executable

# List all files colorized in long format, including dot files with filesize suffixes
alias la="ls -ahl"
alias l="clear && pwd && ls -FGl"
alias u="cd .. && l"

# Rails development
alias b="bundle exec"

alias migrate="rake db:migrate && rake db:test:prepare"
alias rst="touch tmp/restart.txt" #passenger/pow restart

alias wip="rake cucumber:wip"
alias cuke="bundle exec cucumber"
# http://geekystuff.net/2009/01/14/remove-all-ruby-gems/
alias gemclear='gem list | cut -d" " -f1 | xargs gem uninstall -aIx'

alias tlog="tail -f log/development.log"

# https://coderwall.com/p/vyl8zg
alias standup="clear && git log --since '2 days ago' --no-merges --author 'johnpaul'"

# Homebrew
alias brupdate='brew update && brew outdated'

## Ruby

# RBENV
if which rbenv > /dev/null
  then
    eval "$(rbenv init -)"
    export PATH="./bin:$PATH"
fi

# http://samsaffron.com/archive/2013/05/03/eliminating-my-trivial-inconveniences
# export RUBY_GC_MALLOC_LIMIT=1000000000
# export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1.25
# Ruby pre 2.1
# export RUBY_HEAP_MIN_SLOTS=800000
# export RUBY_FREE_MIN=600000

# Ruby 2.1
# export RUBY_GC_HEAP_INIT_SLOTS
# export RUBY_GC_HEAP_FREE_SLOTS
# export LD_PRELOAD=/usr/lib/libtcmalloc_minimal.so

# More also here: http://tmm1.net/ruby21-rgengc/
# export RUBY_GC_HEAP_INIT_SLOTS=600000
# export RUBY_GC_HEAP_FREE_SLOTS=600000
# export RUBY_GC_HEAP_GROWTH_FACTOR=1.25
# export RUBY_GC_HEAP_GROWTH_MAX_SLOTS=300000

# https://gist.github.com/csfrancis/ae59547804aedb82016d
export RUBY_GC_OLDMALLOC_LIMIT=128000000
export RUBY_GC_MALLOC_LIMIT=128000000
export RUBY_GC_HEAP_SLOTS_GROWTH_FACTOR=1.25
export RUBY_GC_HEAP_GROWTH_MAX_SLOTS=300000
export RUBY_GC_HEAP_INIT_SLOTS=1600000
export RUBY_GC_HEAP_FREE_SLOTS=600000
export RUBY_GC_HEAP_OLDOBJECT_LIMIT_FACTOR=1.3

## Python

# pyenv
# if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# To use Homebrew's directories rather than ~/.pyenv add to your profile:
# export PYENV_ROOT=/usr/local/opt/pyenv

# Quickly find the big files in a rails app
function heftiest {
  for file in $(find app/$1/**/*.rb -type f); do wc -l $file ; done  | sort -r | head
}

# highlingint from https://gist.github.com/jimbojsb/1630790
# function light() {
#   if [ -z "$2" ]
#     then src="pbpaste"
#   else
#     src="cat $2"
#   fi
#   $src | highlight -O rtf --syntax $1 --font Inconsolata --style solarized-dark --font-size 24 | pbcopy
# }
# Misc
alias tlf="tail -f"

alias f="find . -iname"
alias m="more"
alias p="ps xa | grep "
alias ducks="du -cksh * | sort -rn|head -11" # Lists folders and files sizes in the current folder
alias topc="top -o cpu"
alias systail="tail -f /var/log/system.log"
alias df="df -h"
alias space="du -shc * .[^.]*"
alias rsync="rsync -avz"

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

# Flush Directory Service cache
alias flush="sudo killall -HUP mDNSResponder" # OSX 10.7 - 10.8

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Shows most used commands, cool script I got this from: http://lifehacker.com/software/how-to/turbocharge-your-terminal-274317.php
alias profileme="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"

# misc
alias clean_term_logs="sudo rm -rf /private/var/log/asl/*.asl"

## Options
export HISTFILESIZE=5000
export EDITOR="subl -n -w"

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"


export GREP_OPTIONS="--color=auto" GREP_COLOR="1;32"

## PATHS
export GOPATH="/Users/johnpaul/.go"
export NODE_PATH="/usr/local/share/npm/lib/node_modules"
export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

if [ -d ~/bin ]; then
	export PATH=~/bin:$PATH  # add your bin folder to the path, if you have it.  It"s a good place to add all your scripts
fi

# Homebrews
# EC2 tools
# export JAVA_HOME="$(/usr/libexec/java_home)"

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

if [ -f `brew --prefix`/etc/bash_completion.d/git-prompt.sh ]; then
    . `brew --prefix`/etc/bash_completion.d/git-prompt.sh
fi

if [ -d /usr/local/share/npm/bin ]; then
	export PATH=/usr/local/share/npm/bin:$PATH
	# source /usr/local/node/lib/node_modules/npm/lib/utils/completion.sh
fi

if [ -f `brew --prefix`/etc/autojump.sh ]; then
  . `brew --prefix`/etc/autojump.sh
fi

source $(brew --repository)/Library/Contributions/brew_bash_completion.sh

if [ -d /usr/local/bin ]; then
	export PATH=/usr/local/bin:$PATH
fi

# Cool trick from Thoughtbot Botcave, http://tinyletter.com/thoughtbot/letters/the-bot-cave-august-and-september-2013
# Add only the current project's bin to our shell's PATH via export PATH=".git/safe/../../bin:$PATH" and mkdir .git/safe.
export PATH=".git/safe/../../bin:$PATH"

# load rbenv if available
if which rbenv &>/dev/null ; then
  eval "$(rbenv init - --no-rehash)"
fi

# mkdir .git/safe in the root of repositories you trust
export PATH=".git/safe/../../bin:$PATH"

## Autocompletion
# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# Could just use `-g` instead, but being explicit
complete -W "NSGlobalDomain" defaults

# Brew autocompletion
source `brew --prefix`/Library/Contributions/brew_bash_completion.sh
