# dotfiles
My dot files. Includes various aliases for commands I commonly use, bash & vim configurations, setup scripts to initialize/setup machines I use, & some git setup.
The setup files add some functionality I find important. Things such as a fuzzy finder [(fzf)](https://github.com/junegunn/fzf), a faster grep [(sift)](https://github.com/svent/sift), & voice to text program for people who have paper-mache wrists like me [(talon voice)](https://talonvoice.com/).

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
  - sift
  - fzf
  - fdfind
  - homebrew (if on mac)
  - xdg-utils & x11-xkb-utils (for capslock remap on Ubuntu)
