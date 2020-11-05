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
