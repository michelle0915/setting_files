dir=$(cd $(dirname $0) ; pwd)

[ -f ~/.aliases ] && rm ~/.aliases
[ -f ~/.functions ] && rm ~/.functions
[ -f ~/.vimrc ] && rm ~/.vimrc
[ -f ~/.vim ] && rm ~/.vim

ln -s $dir/.aliases  ~/.aliases
ln -s $dir/.functions ~/.functions
ln -s $dir/vim/.vimrc ~/.vimrc
ln -s $dir/vim/.vim ~/.vim
