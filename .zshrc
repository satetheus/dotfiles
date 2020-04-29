[[ -e ~/.aliases ]] && emulate sh -c 'source ~/.aliases'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# assure gpg doesn't fail with "inappropriate ioctl for device"
export GPG_TTY=$(tty)
