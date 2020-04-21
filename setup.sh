#! usr/bin/env bash

# setup links for config files
ln -s ~/dotfiles/.gitignore_global ~/.gitignore_global
# will add .gitconfig later
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.bash_aliases ~/.bash_aliases 
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/deus.vim ~/.vim/colors/deus.vim

# setup global git ignore
git config --global core.excludesfile ~/.gitignore_global
