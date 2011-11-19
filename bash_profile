# cd
alias ..='cd ..'
alias ...='cd ../..'
function -() { cd -; }

# ls
alias ls="ls -F"
alias ll="ls -l"
alias la='ls -A'
alias lx='ls -CF'
alias l='ls -aFhlG'
alias c='clear'
alias p='pwd'

# git
alias g="git"
alias gl='git pull'
alias gp='git push'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gb='git branch'
alias gs='git status -sb'
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
alias gci="git pull --rebase && rake && git push"

# rails
alias r='rails'
alias rg='rails generate'

alias s="bundle exec rspec"
alias b="bundle"
alias be="bundle exec"
alias bake="bundle exec rake"

alias migrate="rake db:migrate db:test:prepare"
alias remigrate="rake db:migrate && rake db:migrate:redo && rake db:schema:dump db:test:prepare"
alias remongrate="rake mongoid:migrate && rake mongoid:migrate:redo"
alias rst='touch tmp/restart.txt' #passenger/pow restart


alias wip='rake cucumber:wip'
alias cuc="bundle exec cucumber"
alias cuke='cucumber'

alias gi="gem install"
alias giv="gem install -v"
alias geml="gem list | grep ^[A-Za-z]"
alias gemo="gem outdated"


alias t='terminitor'
alias h='heroku'
alias staging='heroku run console --remote staging'
alias production='heroku run console --remote production'

# thoughbot/dotfiles
# alias -g G='| grep'
# alias -g M='| less'
# alias -g L='| wc -l'
# alias -g ONE="| awk '{ print \$1}'"

# Misc
alias tlf="tail -f"
alias tlog='tail -f log/development.log'

alias f='find . -iname'
alias m='more'
alias p="ps xa | grep " 
alias ducks='du -cksh * | sort -rn|head -11' # Lists folders and files sizes in the current folder
alias topc='top -o cpu'
alias systail='tail -f /var/log/system.log'
alias df='df -h'
alias space="du -shc * .[^.]*"
alias rsync="rsync -avz"

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
export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.4.2.2/jars"
export EC2_AMITOOL_HOME="/usr/local/Cellar/ec2-ami-tools/1.3-45758/jars"
export AWS_RDS_HOME="/usr/local/Cellar/rds-command-line-tools/1.3.003/jars"

export NODE_PATH='/usr/local/lib/node_modules'
export PATH="/usr/local/sbin:/usr/local/bin:$PATH"
export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"
export EDITOR="mate -w"
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'

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
source /usr/local/etc/bash_completion.d/npm
complete -C ~/.bash/completion_scripts/rake_completion -o default rake
complete -C ~/.bash/completion_scripts/capistrano_completion -o default cap