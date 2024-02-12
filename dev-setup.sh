#!/bin/bash

# update apt & install some needed libraries if on linux
printf "\n==OS INITIAL SETUP==\n"
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # update system
    sudo apt -qq update
    sudo apt -qq upgrade -y

    # gh for github cli, fd-find for fzf, & xdg-utils & x11-xkb-utils for capslock remap
    sudo apt -qq install gh golang xdg-utils x11-xkb-utils fd-find -y
    sudo apt-get -qq install -y ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
    # used for ncspot & other cargo packages
    sudo apt -qq install -y libdbus-1-dev libncursesw5-dev libpulse-dev libssl-dev libxcb1-dev libxcb-render0-dev libxcb-shape0-dev libxcb-xfixes0-dev

    sudo apt -qq autoremove -y

elif [[ "$OSTYPE" == "darwin"* ]]; then
    # install homebrew, git, github cli, & neovim if on mac
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    brew install git gh neovim fd-find
fi

printf "\n==INSTALL RUST==\n"
if ! command -v cargo >/dev/null; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

    printf "\n==INSTALL BINSTALL FOR CARGO==\n"
    cargo install cargo-binstall -y
fi

rustc --version

printf "\n==INSTALL PACKAGES FROM CARGO==\n"
cargo binstall nu ripgrep bob-nvim mise -y

printf "\n==INSTALL NEOVIM FROM SOURCE==\n"
bob use latest

nvim --version | head -n 1

printf "\n==SYMLINK HOME AND NVIM FILES==\n"
# setup links for config files
pushd $HOME >/dev/null
find "$HOME/dotfiles/homedir" -maxdepth 1 -printf '%P\n' | while read file; do if ! [ -e $file ]; then ln -s "$HOME/dotfiles/homedir/$file" "bkp.$file"; fi done
popd >/dev/null
mkdir -p $HOME/.config/nvim
pushd $HOME/.config/nvim >/dev/null
find "$HOME/dotfiles/neovim" -maxdepth 1 -printf '%P\n' | while read file; do if ! [ -e $file ]; then ln -s "$HOME/dotfiles/neovim/$file" "bkp.$file"; fi done
popd >/dev/null
printf "Symlinks created\n"

printf "\n==SET GIT GLOBAL EXCLUDES==\n"
# setup global git ignore
git config --global core.excludesfile $HOME/.gitignore_global

# install fzf
printf "\n==FZF GIT INSTALL==\n"
if ! command -v fzf >/dev/null; then
    # git repo is cloned here to make key-binding files available
    git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
    $HOME/.fzf/install
    printf "fzf has been installed\n"
else
    printf "fzf already installed\n"
fi

fzf --version | head -n 1

# install latest lts of node
printf "\n==NODE LATEST LTS INSTALL==\n"
mise install node@lts
mise use --global node@lts

# install python using mise
printf "\n==PYTHON INSTALL==\n"
mise install python@latest
mise use --global python@latest

# this is needed to make sure nvim has access to a python provider
python3 -m pip install --user --upgrade pynvim

# add plugin manager for vim
printf "\n==VIMPLUG GIT INSTALL==\n"
if ! [ -e $HOME/.local/share/nvim/site/autoload/plug.vim ]; then
    # curl may need -k if dealing with harsh firewall
    curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    printf "Vimplug has been installed\n"
else
    printf "Vimplug already installed\n"
fi

# install all plugins for vim, then close all open windows
nvim +PlugInstall +qall
printf "Neovim plugins updated/installed\n"

# add talon & configuration

printf "\n==CREATE LOCAL VARIABLES FILE==\n"
touch $HOME/.local_vars
chmod +x $HOME/.local_vars
printf "local variables file created. Can be used for sensitive environment variables.\n"

# create ssh directory if not exists
mkdir -p ~/.ssh

# restart bash
exec bash -l
