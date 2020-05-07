#! /bin/zsh

# setup links for config files
ln -s ~/dotfiles/.gitignore_global ~/.gitignore_global
# will add .gitconfig later
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.aliases ~/.aliases
ln -s ~/dotfiles/.vimrc ~/.vimrc

mkdir ~/.vim ~/.vim/colors
ln -s ~/dotfiles/deus.vim ~/.vim/colors/deus.vim

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