#!/bin/sh

set -x

cd ~/

ln -s ~/.dotfiles/gvimrc.after ~/.gvimrc.after
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/vim-plugins ~/.janus
ln -s ~/.dotfiles/vimrc.after ~/.vimrc.after
ln -s ~/.dotfiles/vimrc.before ~/.vimrc.before
ln -s ~/.dotfiles/gemrc ~/.gemrc
ln -s ~/.dotfiles/tmux-plugins ~/.tmux-plugins

echo "" >> ~/.bashrc
echo ". ~/dotfiles/bashprompt.sh" >> ~/.bashrc
echo "export $PATH=./node_modules/.bin:$PATH" >> ~/.bashrc
