#! /usr/bin/env bash

#check system is up to date
sudo apt update

# add xdg-utils if not already installed, & x11-xkb-utils for capslock remap
sudo apt install xdg-utils x11-xkb-utils -y

# setup links for config files
ln -s ~/dotfiles/.gitignore_global ~/.gitignore_global
# will add .gitconfig later
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.aliases ~/.aliases 
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/UltiSnips ~/.vim/UltiSnips
ln -s ~/dotfiles/.vim/templates ~/.vim/templates

# setup global git ignore
git config --global core.excludesfile ~/.gitignore_global

# install fzf, could be replaced by 'apt-get install fzf' theorectically
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# add plugin manager for vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install all plugins for vim, then close all open windows
vim +PlugInstall +qall

# add talon & configuration

#install gh, github cli
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
sudo apt-add-repository https://cli.github.com/packages
sudo apt install gh -y

# restart bash
exec bash -l
