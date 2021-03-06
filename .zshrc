# add custom bin directory
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:${PATH}"
    export PATH
fi

# set aliases file
[[ -e ~/.aliases ]] && emulate sh -c 'source ~/.aliases'

# import/install fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# set prompt to include git branch, if applicable
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

zstyle ':vcs_info:*' enable git cvs svn

# or use pre_cmd, see man zshcontrib
vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}
RPROMPT=$'$(vcs_info_wrapper)'

# assure gpg doesn't fail with "inappropriate ioctl for device"
export GPG_TTY=$(tty)

# fixed alt-c equivelant on mac for fzf
bindkey "ç" fzf-cd-widget

# add timestamp to zsh history
setopt EXTENDED_HISTORY

# set history to be added to file immediately
setopt INC_APPEND_HISTORY

# set vi mode in zsh
#bindkey -v
