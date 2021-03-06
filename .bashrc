# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=20000

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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
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


# Alias definitions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias trash='rmtrash'
alias del='rmtrash'

alias s='sudo'
alias sagi='sudo apt-get install'

alias trash='rmtrash'
alias del='rmtrash'

alias g='git'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gcm='git commit -m'
alias gco='git checkout'
alias gp='git push'
alias gst='git status'

alias d='docker'
alias db='docker build'
alias dr='docker run'
alias di='docker image'
alias dils='docker images ls'
alias dirm='docker image rm '

alias p='python3'
alias p2.7='python2.7'
alias p3='python3'
alias pip='pip3'

alias matlab='/Applications/MATLAB_R2019b.app/bin/matlab'
export SPM_PATH=/Applications/MATLAB_R2019b.app/bin/matlab/toolbox/spm12/


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [ -f ~/.pythonrc ]; then
  export PYTHONSTARTUP=~/.pythonrc
  #PYTHONPATH="${PYTHONPATH}.:~/Documents/pyunicorn/:~/Documents/numpy/"
fi

#PYTHONPATH="${PYTHONPATH}.:~/Documents/pyunicorn/:~/Documents/numpy/"
#export PYTHONPATH
#export PYTHONPATH="${PYTHONPATH}.:~/Documents/pyunicorn/:~/Documents/numpy/"
#export PYTHONPATH="${PYTHONPATH}:/usr/local/lib/python2.7/site-packages/"
export PYTHONDONTWRITEBYTECODE=1

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PATH=~/bin:$PATH

# added by travis gem
[ -f /Users/nils/.travis/travis.sh ] && source /Users/nils/.travis/travis.sh

export PATH="/usr/local/opt/llvm/bin:$PATH"
export FREESURFER_HOME=/Applications/freesurfer
source $FREESURFER_HOME/SetUpFreeSurfer.sh
FSLDIR=/usr/local/fsl
. ${FSLDIR}/etc/fslconf/fsl.sh
PATH=${FSLDIR}/bin:${PATH}
export FSLDIR PATH

# auto-inserted by @update.afni.binaries :
export DYLD_LIBRARY_PATH=${DYLD_LIBRARY_PATH}:/opt/X11/lib/flat_namespace

# set up tab completion for AFNI programs
if [ -f $HOME/.afni/help/all_progs.COMP.bash ]
then
  . $HOME/.afni/help/all_progs.COMP.bash
fi

fortune | cowsay #| lolcat
#alias snow=ruby -e 'C=`stty size`.scan(/\d+/)[1].to_i;S=["2743".to_i(16)].pack("U*");a={};puts "\033[2J";loop{a[rand(C)]=0;a.each{|x,o|;a[x]+=1;print "\033[#{o};#{x}H \033[#{a[x]};#{x}H#{S} \033[0;0H"};$stdout.flush;sleep 0.1}'

export DYLD_LIBRARY_PATH=${DYLD_LIBRARY_PATH}:/opt/X11/lib/flat_namespace

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
