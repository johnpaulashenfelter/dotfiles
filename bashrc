#http://tammersaleh.com/posts/a-better-rvm-bash-prompt
function __git_dirty {
  git diff --quiet HEAD &>/dev/null 
  [ $? == 1 ] && echo "!"
}

__rbenv_ps1 ()
{
  rbenv_ruby_version=`rbenv version | sed -e 's/ .*//'`
  printf $rbenv_ruby_version
}

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

  if [ `which rbenv` ]; then
    PS1="$R[\$(__rbenv_ps1 )]$C\u@\h$W:$EMC\w$EMW\$(__git_ps1)$EMY\$(__git_dirty)${NONE} $ "
  else
    PS1="$C\u@\h$W:$EMC\w$EMW\$(__git_ps1)$EMY\$(__git_dirty)${NONE} $ "
  fi
}

bash_prompt
unset bash_prompt

# This runs before the prompt and sets the title of the xterm* window.  If you set the title in the prompt
# weird wrapping errors occur on some systems, so this method is superior
export PROMPT_COMMAND='history -a && echo -ne "\033]0;${USER}@${HOSTNAME%%.*} ${PWD}"; echo -ne "\007"'  # user@host path

# Misc -------------------------------------------------------------
# https://sanctum.geek.nz/arabesque/better-bash-history/
export HISTCONTROL=ignoreboth
export HISTSIZE=100000
export HISTFILESIZE=1000000
#export HISTTIMEFORMAT='%F %T '
export HISTIGNORE="&:ls:z:exit:bg:fg:history:br:heroku *:h:s.:gem *:git ci*" #ls *: ignores all ls commands

if [ -f $(brew --prefix)/bin/bash ]; then
  # https://zwischenzugs.com/2019/04/03/eight-obscure-bash-options-you-might-want-to-know-about/
  shopt -s cdspell #This will correct minor spelling errors in a cd command
  shopt -s autocd
  shopt -s direxpand
  shopt -s checkjobs
  shopt -s globstar
  shopt -s extglob
  shopt -s histverify
  # https://sanctum.geek.nz/arabesque/better-bash-history/
  shopt -s histappend
  shopt -s cmdhist
fi

# bash completion settings (actually, these are readline settings)
bind "set completion-ignore-case on" # note: bind used instead of sticking these in .inputrc
bind "set bell-style none" # no bell
bind "set show-all-if-ambiguous On" # show list automatically, without double tab

set -o vi

# Add direnv
 if [ -f $(brew --prefix)/bin/direnv ]; then
  eval "$(direnv hook bash)"
 fi
