# cd
alias ..='cd ..'

# ls
alias ls="ls -F"
alias ll="ls -l"
alias la='ls -A'
alias lx='ls -CF'
alias l='ls -aFhlG'
#alias l="ls -lAh"
alias ..='cd ..'
alias ...='cd ../..'
function -() { cd -; }
alias c='clear'
alias p='pwd'
alias ma='mate .'

# git
alias gl='git pull'
alias gp='git push'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gb='git branch'
alias gs='git status -sb'
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"

# rails
alias at='autotest -rails'
alias tlog='tail -f log/development.log'
alias scaffold='ruby script/generate nifty_scaffold'
alias migrate='rake db:migrate db:test:clone'
alias rst='touch tmp/restart.txt' #passenger restart
alias wip='rake cucumber:wip'
alias cuke='cucumber'
alias geml="gem list | grep ^[A-Za-z]"
alias gemo="gem outdated"
alias r='rails'
alias sg='script/generate'

function sc {
  if [ -e script/rails ]; then
    rails console $1
  else
    script/console $1
  fi
}
function ss {
  if [ -e script/rails ]; then
    rails server $1
  else
    script/server $1
  fi
}

alias t="terminitor"
# commands starting with % for pasting from web
alias %=' '

# Misc
alias f='find . -iname'
alias g='grep -i'  # Case insensitive grep
alias m='more'
alias p="ps xa | grep " 
alias ducks='du -cksh * | sort -rn|head -11' # Lists folders and files sizes in the current folder
alias topc='top -o cpu'
alias systail='tail -f /var/log/system.log'
alias df='df -h'
alias space="du -shc * .[^.]*"

# Shows most used commands, cool script I got this from: http://lifehacker.com/software/how-to/turbocharge-your-terminal-274317.php
alias profileme="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"

# changing directory to code project
function c { cd ~/clients/$1; }
function p { cd ~/projects/$1; }
function e { cd ~/entryway/$1; }
function w { cd ~/work/$1; }
function f { cd ~/foss/$1; }

# misc
alias reload='. ~/.bash_profile'

#source ~/.bash/completions
source ~/.bash/completion_scripts/git_completion
complete -C ~/.bash/completion_scripts/rake_completion -o default rake
complete -C ~/.bash/completion_scripts/capistrano_completion -o default cap
complete -C ~/.bash/completion_scripts/rvm-completion.rb -o default rvm
#source ~/.bash/paths
export PATH="/usr/local/sbin:/usr/local/bin:$PATH"
export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"
#source ~/.bash/config
export EDITOR="mate -w"
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

if [ -d ~/bin ]; then
	export PATH=~/bin:$PATH  # add your bin folder to the path, if you have it.  It's a good place to add all your scripts
fi

if [ -d /opt/local ]; then
	export PATH=/opt/local/bin:/opt/local/sbin:/opt/local/apache2/bin:/opt/local/lib/postgresql84/bin:$PATH
fi

if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

if [ -d /usr/local/share/npm/bin ]; then
	export PATH=/usr/local/share/npm/bin:$PATH
fi

if [ -d /usr/local/bin ]; then
	export PATH=/usr/local/bin:$PATH
fi
  
if [[ -s "$HOME/.rvm/scripts/rvm" ]]  ; then source "$HOME/.rvm/scripts/rvm" ; fi
	
export RUBYLIB="/usr/local/lib:$RUBYLIB"