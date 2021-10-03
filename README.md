# dotfiles
My dot files. Includes various aliases for commands I commonly use, bash & vim configurations, setup scripts to initialize/setup machines I use, & some git setup.
The setup files add some functionality I find important. Things such as a fuzzy finder (fzf), a faster grep (sift), & voice to text program for people who have paper-mache wrists like me (talon voice).

## Install
### Linux (Ubuntu)
  - Clone repo
  - Run `bash-setup.sh your_email your_username ssh_key_name gh_auth_token_location gpg_key_location`

### Mac
  - Clone repo
  - Run `zsh-setup.sh` (may require extra permissions)

### Windows
  - Install wsl (`wsl --install` in powershell or cmd on modern windows)
  - Clone repo in wsl home directory (Could this be made simpler in case git isn't installed?)
  - Run `bash-setup.sh`

## ToDo
 - Create windows/wsl setup file (batch/powershell file)
 - Combine zsh & bash setups into 1 file
 - Create command/program to list all aliases & what they do
 - Add capslock remap to windows setup
 - Create a *lite* version of setup script, &/or make setup scripts more multi-user friendly.
 - Add talonvoice configuration to setup files (consider adding autostart as well).
