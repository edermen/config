# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ \[$GREEN\]\t\[$RED\]-\[$BLUE\]\u\[$YELLOW\]\[$YELLOW\]\w\[\033[m\]\[$MAGENTA\]\$(__git_ps1)\[$WHITE\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt
# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias 11='ls -1'
alias 1a='ls -1a'
alias mk='mkdir'
alias rn='ranger'
alias vi='vim'
alias cls='clear'
alias ssd='sudo -s'
alias du='du -skc'
alias exx='exit'
# apt/aptitude alias
alias inn='sudo apt-get install -y'
alias aptu='sudo apt-get update'
alias apgr='sudo apt-get upgrade'
alias aptrem='sudo apt-get autoremove'
#ssh alias
alias sstop='sudo service ssh stop'
alias sstrt='sudo service ssh start'
alias ssres='sudo service ssh restart'
# APACHE alias
alias aprel='sudo service apache2 reload'
alias apstop='sudo service apache2 stop'
alias apst='sudo service apache2 start'
# docker command
alias dps='docker ps'
alias dpsa='docker ps -a'
alias dimg='docker images'
alias dst='docker start'
alias daa='docker attach'
alias dlog='docker log'
alias drm='docker rm'
alias drmi='docker rmi'
alias dstat='docker stats'
alias drma='docker rm $(docker ps -a -q)'
alias drmi='docker rmi $(docker images -q)'
#  git alias
alias gss='git status'
alias gl='git log'
alias gl1='git log -1'
alias glp='git log -p'
alias gaa='git add .'
alias gb='git branch'
alias gcn='git checkout -b'
alias gcc='git commit -m'
alias gct='git commit -m "`echo $DATEST`"'
alias gp='git push'
alias gpul='git pull'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if ! shopt -oq posix; then
#  if [ -f /usr/share/bash-completion/bash_completion ]; then
#    . /usr/share/bash-completion/bash_completion
#  elif [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#  fi
#fi
#if [ -f /etc/profile.d/bash_completion.sh ]; then
#     . /etc/profile.d/bash_completion.sh
#fi
export EDITOR='vim'
### Added by the Heroku Toolbelt
 export PATH="/usr/local/heroku/bin:$PATH"


export PATH="$HOME/.rbenv/bin:$PATH"
export EDITOR='vim'
eval "$(rbenv init -)"
[ -r /home/solli/.byobu/prompt ] && . /home/solli/.byobu/prompt   #byobu-prompt#
export PATH="$HOME/.tmuxifier/bin:$PATH"
eval "$(tmuxifier init -)"
[[ -s "/home/solli/.gvm/scripts/gvm" ]] && source "/home/solli/.gvm/scripts/gvm"


DATEST='Temporary commit on ~ '$(date +%H:%M:%S)' > '$(date +%d/%m/%Y)
export DATEST
