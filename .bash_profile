# Aliases

alias la='ls -a'
alias ll='ls -l'
alias lla='ls -al'

alias gpushcurr='git rev-parse --abbrev-ref HEAD | xargs git push origin'

gcommit () {
    git commit -am "$1"
}
