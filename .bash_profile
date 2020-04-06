# Aliases

alias la='ls -a'
alias ll='ls -al'
alias e='exit'

alias gpushcurr='git rev-parse --abbrev-ref HEAD | xargs git push origin'

gcommit () {
    git commit -am "$1"
}

gcp () {
    git commit -am "$1" && gpushcurr
}
