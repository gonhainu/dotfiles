#!/bin/sh

# NeoBundleをCloneする
git clone git://github.com/Shougo/neobundle.vim .vim/bundle/neobundle.vim

ln -nsf ./.vimrc ~/.vimrc
ln -nsf .vim/ .vim
