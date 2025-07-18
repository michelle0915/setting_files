dir=$(cd $(dirname $0) ; pwd)

FLG_S=0
while getopts s OPT
do
  case $OPT in
    "s" ) FLG_S=1 ;;
      * ) echo "Usage: makelinks.sh [-s]" 1>&2
          exit 1 ;;
  esac
done

[ -L ~/.aliases ] && rm ~/.aliases
[ -L ~/.functions ] && rm ~/.functions
[ -L ~/.vimrc ] && rm ~/.vimrc
[ -L ~/.vim ] && rm ~/.vim

ln -s $dir/.aliases  ~/.aliases
ln -s $dir/.functions ~/.functions
if [ $FLG_S -eq 1 ]; then
    ln -s $dir/vim/.vimrc_s ~/.vimrc
else
    ln -s $dir/vim/.vimrc ~/.vimrc
fi

ln -s $dir/vim/.vim ~/.vim
ln -s $dir/nvim ~/.config/nvim
