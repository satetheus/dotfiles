#!/bin/bash

# update apt & install some needed libraries if on linux
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # update system
    sudo apt update

    # gh for github cli, neovim, fd-find for fzf, & xdg-utils & x11-xkb-utils for capslock remap
    sudo apt install gh neovim xdg-utils x11-xkb-utils fd-find -y

elif [[ "$OSTYPE" == "darwin"* ]]; then
    # install homebrew, git, github cli, & neovim if on mac
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    brew install git gh neovim fd-find
fi

# setup links for config files
pushd $HOME
find "$HOME/dotfiles/homedir" -maxdepth 1 -printf '%P\n' | while read file; do ln -s "$HOME/dotfiles/homedir/$file" "$file"; done
popd
mkdir $HOME/.config/nvim
pushd $HOME/.config/nvim
find "$HOME/dotfiles/neovim" -maxdepth 1 -printf '%P\n' | while read file; do ln -s "$HOME/dotfiles/neovim/$file" "$file"; done
popd

# setup global git ignore
git config --global core.excludesfile $HOME/.gitignore_global

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
$HOME/.fzf/install

# install node.js with version manage & linter
pushd $HOME/
git clone https://github.com/nvm-sh/nvm.git .nvm
. .nvm/install.sh && nvm install node && npm install -g jshint
popd

# add plugin manager for vim
curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install all plugins for vim, then close all open windows
nvim +PlugInstall +qall

# add talon & configuration

# add sift
pushd /tmp
wget https://sift-tool.org/downloads/sift/sift_0.9.0_linux_amd64.tar.gz && \
tar xzf sift_0.9.0_linux_amd64.tar.gz && \\
sudo mv sift_0.9.0_linux_amd64/sift /usr/local/bin/
popd

# restart bash
exec bash -l
