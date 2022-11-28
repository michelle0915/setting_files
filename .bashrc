#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTSIZE=10000
export EDITOR='vim'

source ~/.aliases
source ~/.functions

PS1='[\u@\h \W]\$ '

# Font setting
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"

# PHP Laravel framework
export PATH="$PATH:~/.config/composer/vendor/bin"

# rbenv
export PATH="$PATH:~/.rbenv/bin"
eval "$(rbenv init -)"

# perl-cpanminus
PATH="/home/mikio/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/mikio/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/mikio/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/mikio/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/mikio/perl5"; export PERL_MM_OPT;

HISTTIMEFORMAT='%F %T '
HISTSIZE=100000
export HISTSIZE HISTTIMEFORMAT
export EDITOR='vim'
export SCREENDIR=$HOME/.screen

source ~/.aliases
source ~/.functions

stty stop undef
stty start undef

# AWS CLI
# export INSTANCE_ID='i-0a81c9e718473605e' # neopulse3 micro
export INSTANCE_ID='i-031c588000e750c81' # neopulse3 aidkk

# S+ camera
export R2D2='d-m8qk4fo61vbiu4nc0hq6' # R2D2 device ID
export BB8='d-6vc8t54q0s5livgmjr3k' # BB8 device ID
export NOBU='d-n58rj8dhuo3lqq9f1olo' # Camera-Nobu device ID
export EMPEROR='d-73blalc0l3vcvgr57ltn' # Emperor device ID
export SMIKIO='d-n58rj8dhuo3lqq9f1olo' # S+Mikio device ID

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# display git branch on console
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
if [ -f /etc/bash_completion.d/git-prompt ]; then
    export PS1='\[\033[01;32m\]\u@\h\[\033[01;33m\] \w$(__git_ps1) \[\033[01;34m\]\$\[\033[00m\] '
else
    export PS1='\[\033[01;32m\]\u@\h\[\033[01;33m\] \w \[\033[01;34m\]\$\[\033[00m\] '
fi

# path for node global module
export NODE_PATH=$(npm root -g)

export XDG_CONFIG_HOME=$HOME/.config

# git ssh config
#eval `ssh-agent`
#ssh-add ~/.ssh/id_git_rsa

# WSL-VcXsrv
export DISPLAY="`grep nameserver /etc/resolv.conf | sed 's/nameserver //'`:0"

# JAVA
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export ANT_HOME=/usr/share/ant
