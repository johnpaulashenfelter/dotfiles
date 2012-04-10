alias c='clear'
alias p='pwd'

# Easier navigation
alias ..='cd ..'
alias ...='cd ../..'

# Always colorize ls
alias ls="ls -GF" # colorize and indicate type/executable

# List all files colorized in long format, including dot files with filesize suffixes
alias la="ls -ahl"

# shortcuts
alias g="git"
alias mvim='rvm default do /usr/local/bin/mvim $@'

# dev shortcuts
alias r='rails'
alias be="bundle exec"

alias migrate="rake db:migrate db:test:prepare"
alias remigrate="rake db:migrate && rake db:migrate:redo && rake db:schema:dump db:test:prepare"
alias rst='touch tmp/restart.txt' #passenger/pow restart

alias wip='rake cucumber:wip'
alias cuke="bundle exec cucumber"

alias gi="gem install"
alias giv="gem install -v"
alias geml="gem list | grep ^[A-Za-z]"
alias gemo="gem outdated"

alias t='terminitor'
alias h='heroku'
alias staging='heroku run console --remote staging'
alias production='heroku run console --remote production'

alias tlog='tail -f log/development.log'

# Misc
alias tlf="tail -f"

alias f='find . -iname'
alias m='more'
alias p="ps xa | grep " 
alias ducks='du -cksh * | sort -rn|head -11' # Lists folders and files sizes in the current folder
alias topc='top -o cpu'
alias systail='tail -f /var/log/system.log'
alias df='df -h'
alias space="du -shc * .[^.]*"
alias rsync="rsync -avz"

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults


# Shows most used commands, cool script I got this from: http://lifehacker.com/software/how-to/turbocharge-your-terminal-274317.php
alias profileme="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"

# changing directory to code project
function p { cd ~/projects/$1; }
function w { cd ~/work/$1; }
function f { cd ~/foss/$1; }
function c { cd ~/clients/$1; }

# misc
alias reload='. ~/.bash_profile'

export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home"
export EC2_PRIVATE_KEY="$(/bin/ls $HOME/.ec2/pk-*.pem)"
export EC2_CERT="$(/bin/ls $HOME/.ec2/cert-*.pem)"
export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.5.2.5/jars"
export EC2_AMITOOL_HOME="/usr/local/Cellar/ec2-ami-tools/1.3-45758/jars"
export AWS_RDS_HOME="/usr/local/Cellar/rds-command-line-tools/1.3.003/jars"

export NODE_PATH='/usr/local/lib/node_modules'
export PATH="/usr/local/sbin:/usr/local/bin:$PATH"
export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"
export EDITOR="mate -w"
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'

# For ruby (1.9.3) performance release, REE
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

if [ -d ~/bin ]; then
	export PATH=~/bin:$PATH  # add your bin folder to the path, if you have it.  It's a good place to add all your scripts
fi

# Homebrews
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

if [ -d /usr/local/share/npm/bin ]; then
	export PATH=/usr/local/share/npm/bin:$PATH
fi

if [ -d /usr/local/bin ]; then
	export PATH=/usr/local/bin:$PATH
fi
  
if [[ -s "$HOME/.rvm/scripts/rvm" ]]  ; then source "$HOME/.rvm/scripts/rvm" ; fi
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion
	
export RUBYLIB="/usr/local/lib:$RUBYLIB"
source /usr/local/etc/bash_completion.d/git-completion.bash
complete -C ~/.bash/completion_scripts/rake_completion -o default rake
complete -C ~/.bash/completion_scripts/capistrano_completion -o default cap
[[ -s "/Users/johnpaul/.rvm/scripts/rvm" ]] && source "/Users/johnpaul/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
