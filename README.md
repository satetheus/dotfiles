# dotfiles
-------------------------------------------------------------------------------------
## ARCHIVED
No more development is happening on this repo. This will be replaced with dotfiles-v2.
-------------------------------------------------------------------------------------
My dot files. Includes various aliases for commands I commonly use, bash & vim configurations, setup scripts to initialize/setup machines I use, & some git setup.
The setup files add some functionality I find important. Things such as a fuzzy finder [(fzf)](https://github.com/junegunn/fzf), a faster grep [(ripgrep)](https://github.com/BurntSushi/ripgrep), my preferred editor [(neovim)](https://neovim.io/), & making sure recent & stable version of the languages I use are available.

## Install
### Windows
  - Install wsl (`wsl --install` in powershell or cmd on modern windows)
  - follow Linux/Mac install instructions from within wsl

### linux (Ubuntu) or Mac
  - Clone repo & change to repo directory
  - Run `dev-setup.sh`

## The .local_vars file
This file is for storing more sensitive variables in the local environment while keeping them out of the source control.

Some important variables to define include:
| Variable    | Description                                                                                           |
| --------    | -----------                                                                                           |
| PROJECT_DIR | Used by customized fzf setup to allow fuzzy searching windows files from wsl                          |
| SSH_ID_FILE | Used to identify the file for ssh to use for git connections, but available for other ssh connections |

## Dependencies
  - git
  - gh
  - neovim
  - ripgrep
  - fzf
  - fdfind
  - homebrew (if on mac)
  - xdg-utils & x11-xkb-utils (for capslock remap on Ubuntu)
