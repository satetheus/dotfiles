#!/bin/bash

# update apt & install some needed libraries if on linux
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    #check system is up to date
    sudo apt update

    # add xdg-utils if not already installed, & x11-xkb-utils for capslock remap
    sudo apt install xdg-utils x11-xkb-utils -y
fi

# setup links for config files
ln -s ~/dotfiles/.gitignore_global ~/.gitignore_global
# will add .gitconfig later
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.aliases ~/.aliases 
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/UltiSnips ~/.vim/UltiSnips
ln -s ~/dotfiles/.vim/templates ~/.vim/templates

# install homebrew & git if on mac
if [[ "$OSTYPE" == "darwin"* ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    brew install git
fi

# setup global git ignore
git config --global core.excludesfile ~/.gitignore_global

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# install node.js with version manage & linter
pushd ~/
git clone https://github.com/nvm-sh/nvm.git .nvm
. .nvm/install.sh && nvm install node && npm install -g jshint
popd

# add plugin manager for vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install all plugins for vim, then close all open windows
vim +PlugInstall +qall

# add talon & configuration

# add sift
pushd /tmp
wget https://sift-tool.org/downloads/sift/sift_0.9.0_linux_amd64.tar.gz && \
tar xzf sift_0.9.0_linux_amd64.tar.gz && \\
sudo mv sift_0.9.0_linux_amd64/sift /usr/local/bin/
popd

# install gh, github cli
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # is the adding of this keyserver necessary or a good idea?
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
    sudo apt-add-repository https://cli.github.com/packages
    sudo apt install gh -y
elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install gh
fi

# restart bash
exec bash -l