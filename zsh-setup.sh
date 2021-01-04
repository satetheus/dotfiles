#! /bin/zsh

# setup links for config files
ln -s ~/dotfiles/.gitignore_global ~/.gitignore_global
# will add .gitconfig later
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.aliases ~/.aliases
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/UltiSnips ~/.vim/UltiSnips
ln -s ~/dotfiles/.vim/templates ~/.vim/templates

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# setup global git ignore
git config --global core.excludesfile ~/.gitignore_global

# install fzf
brew install fzf
/usr/local/opt/fzf/install

# install fzf plugin for vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#add talon & configuration

#add sift
brew install sift

#install gh, github cli
brew install gh

# restart zsh
exec zsh -l
