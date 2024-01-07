#!/usr/bin/env sh


INSTALLDIR="$(dirname "$(readlink -f "$0")")"
NVIMDIR=~/.config/nvim
echo "Install dir is $INSTALLDIR"

if ! which nvim ;then
    echo Installing nvim;
    sudo dnf install \
        neovim \
        luarocks \
        composer
fi

if [ ! -d ${NVIMDIR} ]; then
    echo "Creating ${NVIMDIR}"
    mkdir -p ${NVIMDIR}/..
    git clone https://github.com/LunarVim/Launch.nvim.git ~/.config/nvim
fi

#if [ ! -f ${NVIMDIR}/init.vim ]; then
#    echo "Now, we will create ~/.config/init.vim"
#    ln -sfn $INSTALLDIR/init.vim ${NVIMDIR}/init.vim
#fi

python3 -m pip install --user --upgrade pynvim
npm i -g neovim

