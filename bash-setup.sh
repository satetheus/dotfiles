#! usr/bin/env bash

# setup links for config files
ln -s ~/dotfiles/.gitignore_global ~/.gitignore_global
# will add .gitconfig later
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.aliases ~/.aliases 
ln -s ~/dotfiles/.vimrc ~/.vimrc

# setup global git ignore
git config --global core.excludesfile ~/.gitignore_global

# install fzf, could be replaced by 'apt-get install fzf' theorectically
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# install fzf plugin for vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# restart bash
exec bash -l
