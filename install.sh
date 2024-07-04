#!/bin/sh

set -x

cd ~/

if [ ! -f flox-1.1.0.x86_64-linux.deb ]; then
  echo "Downloading flox"
  wget -O flox-1.1.0.x86_64-linux.deb https://downloads.flox.dev/by-env/stable/deb/flox-1.1.0.x86_64-linux.deb
  sudo dpkg -i flox-1.1.0.x86_64-linux.deb
fi

if [ ! -f ~/.tmux.conf ]; then
  ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
fi

if [ ! -d ~/.flox ]; then
  mkdir -p ~/.flox/env/
  ln -s ~/.dotfiles/manifest.toml ~/.flox/env/
  ln -s ~/.dotfiles/manifest.lock ~/.flox/env/
  ln -s ~/.dotfiles/env.json ~/.flox/
fi

if [ ! -f ~/.config/nvim/init.vim ]; then
  mkdir -p ~/.config/nvim/
  ln -s ~/.dotfiles/init.vim ~/.config/nvim/init.vim
fi

if [ ! -f ~/.local/share/nvim/site/autoload/plug.vim ]; then
  echo "Installing vim-plug"
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi

# determine if current shell is fish
default_shell=$(getent passwd "$(whoami)" | cut -d: -f7)
if [ "$default_shell" != "/usr/bin/fish" ]; then
  echo "Setting up fish"
  sudo chsh mcolyer -s /usr/bin/fish
  /usr/bin/fish -c "fish_config prompt save scales"
  echo "if status is-interactive
     eval "\$\(flox activate --dir ~\)"
  end" > ~/.config/fish/config.fish
fi

# detect if EDITOR is set
if [ -z "$EDITOR" ]; then
  echo "Setting editor to nvim"
  /usr/bin/fish -c "set -Ux EDITOR nvim"
fi

# detect if git user is set
if [ -z "$(git config --global user.email)" ]; then
  echo "Setting up git"
  git config --global user.email "matt@colyer.name"
  git config --global user.name "Matt Colyer"
  git config --global core.editor nvim
  git config --global init.defaultBranch main
fi
