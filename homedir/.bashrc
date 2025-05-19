# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# History Options
shopt -s histappend # append to the history file, don't overwrite it
HISTSIZE=
HISTFILESIZE=
export HISTTIMEFORMAT="%d/%m/%y %T " # add timestamp to bash history
HISTCONTROL=ignoreboth # no duplicates or lines starting with space

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# set colored git branch display
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="\u@\h \[\e[32m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[00m\]$ "

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# expand aliases so they are available in non-interactive sessions
shopt -s expand_aliases

# Alias definitions.
[ -f "$HOME/.aliases" ] && source "$HOME/.aliases"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# autorun ssh-agent
# Others have recommended the use of keychain, such as:
# "eval `keychain --quiet --eval --agents ssh id_rsa`"
# keychain setup asks for ssh key password at terminal startup, rather than at each use.
env=~/.ssh/agent.env
agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }
agent_start () {
    (umask 077; ssh-agent >| "$env")
    . "$env" >| /dev/null ; }
agent_load_env
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)
if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
    agent_start
    ssh-add
elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
    ssh-add
fi
unset env


# assure gpg doesn't fail with "inappropriate ioctl for device"
export GPG_TTY=$(tty)

# set vi/vim keybindings
set -o vi
set editing-mode vi
set keymap vi

# ensure vim is the default editor used by other programs
# using both editor & visual here ensures programs using the less-than-correct
# variable "EDITOR" will still use vim
# WARNING: this may cause issues on low-baud modems or when addressing slow
# serial lines. See:
# https://unix.stackexchange.com/questions/4859/visual-vs-editor-what-s-the-difference
export VISUAL=nvim
export EDITOR="$VISUAL"

# add nvim to path
PATH="$PATH:~/.local/share/bob/nvim-bin"


# source for rust if exists
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

# activate mise if exists
[ -f "$HOME/.cargo/bin/mise" ] && eval "$($HOME/.cargo/bin/mise activate bash)"

# sources bash fzf files if exists. Important for linux systems
[ -f "$HOME/.fzf.bash" ] && source "$HOME/.fzf.bash"

# sets up proper configuration for fzf on nixos, DO NOT REMOVE
if command -v fzf-share >/dev/null; then
    source "$(fzf-share)/key-bindings.bash"
    source "$(fzf-share)/completion.bash"
fi

# add local variables from another file, if exists
[ -f "$HOME/.local_vars" ] && source "$HOME/.local_vars"

export FZF_DEFAULT_COMMAND="rg --files --follow $HOME $PROJECT_DIR"
# set fzf to use fd
if ! command -v fdfind > /dev/null; then
    # set alt-c to search all directories
    export FZF_ALT_C_COMMAND="fd . $HOME $PROJECT_DIR --type d"
else
    # set alt-c to search all directories
    export FZF_ALT_C_COMMAND="fdfind . $HOME $PROJECT_DIR --type d"
fi

