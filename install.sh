#!/bin/sh

set -x

cd ~/

ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
mkdir -p ~/.config/nvim/
ln -s ~/.dotfiles/init.vim ~/.config/nvim/init.vim
# Install plugged
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
