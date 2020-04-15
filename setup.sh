#! usr/bin/env bash

# setup links for config files
ln ~/dotfiles/.gitignore_global ~/.gitignore_global
# will add .gitconfig later
ln ~/dotfiles/.bashrc ~/.bashrc
ln ~/dotfiles/.bash_aliases ~/.bash_aliases 
ln ~/dotfiles/.vimrc ~/.vimrc
ln ~/dotfiles/deus.vim ~/.vim/colors/deus.vim

# setup global git ignore
git config --global core.excludesfile ~/.gitignore_global
