#http://tammersaleh.com/posts/a-better-rvm-bash-prompt
bash_prompt() {
  local NONE="\[\033[0m\]"    # unsets color to term's fg color

  # regular colors
  local K="\[\033[0;30m\]"    # black
  local R="\[\033[0;31m\]"    # red
  local G="\[\033[0;32m\]"    # green
  local Y="\[\033[0;33m\]"    # yellow
  local B="\[\033[0;34m\]"    # blue
  local M="\[\033[0;35m\]"    # magenta
  local C="\[\033[0;36m\]"    # cyan
  local W="\[\033[0;37m\]"    # white

  # emphasized (bolded) colors
  local EMK="\[\033[1;30m\]"
  local EMR="\[\033[1;31m\]"
  local EMG="\[\033[1;32m\]"
  local EMY="\[\033[1;33m\]"
  local EMB="\[\033[1;34m\]"
  local EMM="\[\033[1;35m\]"
  local EMC="\[\033[1;36m\]"
  local EMW="\[\033[1;37m\]"

  # background colors
  local BGK="\[\033[40m\]"
  local BGR="\[\033[41m\]"
  local BGG="\[\033[42m\]"
  local BGY="\[\033[43m\]"
  local BGB="\[\033[44m\]"
  local BGM="\[\033[45m\]"
  local BGC="\[\033[46m\]"
  local BGW="\[\033[47m\]"

  local UC=$W                 # user's color
  [ $UID -eq "0" ] && UC=$R   # root's color

  PS1="$R[\$(~/.rvm/bin/rvm-prompt)]$C\u@\h$W:$EMC\w$EMW\$(__git_ps1)${NONE} $ "
}

bash_prompt
unset bash_prompt

function heftiest {
  for file in $(find app/$1/**/*.rb -type f); do wc -l $file ; done  | sort -r | head
}

function routes {
 rake routes | sed -e "1d" -e "s,^[^/]*,,g" | awk '{print $1}' | sort | uniq 
}
# This runs before the prompt and sets the title of the xterm* window.  If you set the title in the prompt
# weird wrapping errors occur on some systems, so this method is superior
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*} ${PWD}"; echo -ne "\007"'  # user@host path

# Misc -------------------------------------------------------------
export HISTCONTROL=ignoredups
export HISTIGNORE="&:ls:exit" #ls *: ignores all ls commands

shopt -s cdspell #This will correct minor spelling errors in a cd command

# bash completion settings (actually, these are readline settings)
bind "set completion-ignore-case on" # note: bind used instead of sticking these in .inputrc
bind "set bell-style none" # no bell
bind "set show-all-if-ambiguous On" # show list automatically, without double tab

export CDPATH=.:~:~/work:~/projects:~/clients:~/server:~/foss #does for the cd built-in what PATH does for executables. 

# Java
#export JAVA_HOME=/usr
#export ANT_HOME=/usr/share/ant
#export GRAILS_HOME=/opt/local/share/java/grails

# Subversion & Diff ------------------------------------------------
export SV_USER='jashenfelter'  # Change this to your username that you normally use on subversion (only if it is different from your logged in name)
export SVN_EDITOR='${EDITOR}'
alias svn?='svn st | grep ?'
source /Users/johnpaul/.lightning/functions.sh

