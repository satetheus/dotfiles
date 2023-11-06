#!/bin/bash

# update apt & install some needed libraries if on linux
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # update system
    sudo apt -qq update
    sudo apt -qq upgrade -y

    # gh for github cli, fd-find for fzf, & xdg-utils & x11-xkb-utils for capslock remap
    sudo apt -qq install gh golang xdg-utils x11-xkb-utils fd-find -y
    sudo apt-get -qq install -y ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen

    sudo apt -qq autoremove -y

elif [[ "$OSTYPE" == "darwin"* ]]; then
    # install homebrew, git, github cli, & neovim if on mac
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    brew install git gh neovim fd-find
fi

printf "\n==INSTALL NEOVIM FROM SOURCE==\n"
if ! command -v nvim >/dev/null; then
    printf "Neovim is not installed, building from source\n"
    # build nvim from source
    pushd /tmp >/dev/null
    git clone https://github.com/neovim/neovim --depth 5
    cd neovim
    git checkout stable
    rm -rf build/
    make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/neovim"
    make install
    popd >/dev/null

    # Check if PATH update is already in .bashrc and add it if it's not
    if ! grep -q 'export PATH="$HOME/neovim/bin:$PATH"' $HOME/.bashrc; then
                echo 'export PATH="$HOME/neovim/bin:$PATH"' >> $HOME/.bashrc
    fi
    export PATH="$HOME/neovim/bin:$PATH"

    printf "Neovim installation complete.\n"
else
    printf "Neovim already installed\n"
fi

nvim --version | head -n 1


printf "\n==SYMLINK HOME AND NVIM FILES==\n"
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
