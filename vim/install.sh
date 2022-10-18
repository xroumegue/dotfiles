#!/usr/bin/env sh


INSTALLDIR="$(dirname "$(readlink -f "$0")")"
echo "Install dir is $INSTALLDIR"

if [ ! -f ~/.vim ]; then
    echo "Now, we will create ~/.vim and ~/.vimrc files to configure Vim."
    ln -sfn $INSTALLDIR ~/.vim
fi

if [ ! -f ~/.vimrc ]; then
	echo "Creating ~/.vimrc"
    ln -sfn $INSTALLDIR/vimrc ~/.vimrc
fi

if [ ! -d "$INSTALLDIR/bundle" ]; then
    echo "Now, we will create a separate directory to store the bundles Vim will use."
    mkdir "$INSTALLDIR/bundle"
    mkdir -p "$INSTALLDIR/tmp/backup" "$INSTALLDIR/tmp/swap" "$INSTALLDIR/tmp/undo"
fi

if [ ! -d "$INSTALLDIR/bundle/vundle" ]; then
    echo "Then, we install Vundle (https://github.com/VundleVim/Vundle.vim)."
	git clone https://github.com/VundleVim/Vundle.vim.git $INSTALLDIR/bundle/Vundle.vim

fi

echo "Installing all plugins"
vim +BundleInstall +qall


echo "Compiling YouCompleteMe"
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --clang-completer --clangd-completer
