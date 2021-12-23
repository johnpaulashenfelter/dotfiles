#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# Plugins https://blog.devgenius.io/enhance-your-terminal-with-zsh-and-prezto-ab9abf9bc424
#zplug "plugins/git",   from:oh-my-zsh
#zplug "plugins/osx",   from:oh-my-zsh
#zplug "zsh-users/zsh-autosuggestions"
#zplug "clvv/fasd"
#zplug "b4b4r07/enhancd"
#zplug "junegunn/fzf"
#zplug "Peltoche/lsd"
#zplug romkatv/powerlevel10k, as:theme, depth:1

eval "$(zoxide init zsh)"

if [ -f $(brew --prefix)/bin/direnv ]; then
  eval "$(direnv hook zsh)"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# export STARSHIP_CONFIG="~/.dotfiles/starship.toml"
eval "$(starship init zsh)"

. /usr/local/opt/asdf/libexec/asdf.sh


if [ -d ~/bin ]; then
  export PATH=~/bin:$PATH  # add your bin folder to the path, if you have it.  It"s a good place to add all your scripts
fi

## Aliases
### Easier navigation
alias ..="cd .."
alias ...="cd ../.."

### Enhancements
alias cat="bat"
alias find="fd"
alias ls="exa"

### Easier listing
#alias ls="ls -GF" # always colorize and indicate type/executable
# List all files colorized in long format, including dot files with filesize suffixes
# alias la="ls -ahql"
# alias l="clear && pwd && ls -FGl"
# alias u="cd .. && l"

### Shorthand
alias c="clear"
alias df="df -h"
# alias ducks="du -cksh * | sort -rn|head -11" # Lists folders and files sizes in the current folder
alias hist="history | grep"
alias m="more"
# alias p="ps xa | grep "
# Shows most used commands, cool script I got this from: http://lifehacker.com/software/how-to/turbocharge-your-terminal-274317.php
# alias profileme="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"
# alias psgrep="ps aux | grep"
# alias reload=". ~/.bash_profile"
alias rsync="rsync -avz"
# alias space="du -shc * .[^.]*"
# alias systail="tail -f /var/log/system.log"
# alias t="less +F"

## Common tasks

alias br="brew update && echo $'\nOutdated\n' && brew outdated && echo $'\nCasks\n' && brew outdated --cask"

# Clear camera list for video calls
alias camerafix='sudo killall VDCAssistant'

# Flush Directory Service cache
alias flush="sudo killall -HUP mDNSResponder" # OSX 10.7 - 10.8

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

## View HTTP traffic
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"

## Homebrew
alias brupdate='brew update && brew outdated'


# Development
alias g="git"
alias h="heroku"
alias s.="code ."
alias vsc="code ."
alias standup="clear && git log --since '2 days ago' --no-merges --author 'johnpaul'"
# alias dw="/Applications/DeltaWalker.app/Contents/MacOS/DeltaWalker"
# from https://makandracards.com/makandra/505327-git-shortcut-to-fixup-a-recent-commit
alias fixup='git log --oneline | fzf | awk '\''{print $1}'\'' | xargs -I '\''{}'\'' git commit --fixup {}'
alias recent-branch="git for-each-ref --sort=-committerdate --format='%(refname:short)' refs/heads/ |  fzf | sed 's/\* //g' | xargs -I '{}' git checkout {}"

# Python/Anaconda/ML
# export PATH="/usr/local/anaconda3/bin:$PATH"  # commented out by conda initialize
# alias sa="source activate "
# alias jup="jupyter notebook"

# Cool trick from Thoughtbot Botcave, http://tinyletter.com/thoughtbot/letters/the-bot-cave-august-and-september-2013
# Add only the current project's bin to our shell's PATH via export PATH=".git/safe/../../bin:$PATH" and mkdir .git/safe.
# mkdir .git/safe in the root of repositories you trust
export PATH=".git/safe/../../bin:$PATH"

## Rails
alias b="bundle exec"
# alias cov='/usr/bin/open -a "/Applications/Google Chrome.app" coverage/index.html'
# # http://geekystuff.net/2009/01/14/remove-all-ruby-gems/
# alias gemclear='gem list | cut -d" " -f1 | xargs gem uninstall -aIx'
# alias migrate="rails db:migrate && rake db:test:prepare"
# alias rst="touch tmp/restart.txt" #passenger/puma-dev restart
# # https://coderwall.com/p/vyl8zg
# alias tlog="less +F log/development.log"

## Docker
# alias dc='docker-compose'
# alias dcl='docker-compose logs'
# alias dcr='docker-compose run'

# Quickly find the big files in a rails app
function heftiest {
  for file in $(find app/$1/**/*.rb -type f); do wc -l $file ; done  | sort -r | head
}


if [ -d /usr/local/opt/mysql@5.7/bin ]; then
  export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
fi

if [ -d /usr/local/opt/postgresql/bin ]; then
  export PATH="/usr/local/opt/postgresql/bin:$PATH"
fi

if [ -d $HOME/.local/include ]; then
  for i in $HOME/.local/include/*;
    do source $i
  done
fi