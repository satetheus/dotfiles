# Aliases

alias la='ls -a'
alias ll='ls -al'
alias q='exit'

alias cdd='pushd'
alias b='popd'

alias glog='git log --oneline'
alias gpushcurr='git rev-parse --abbrev-ref HEAD | xargs git push origin'
alias gstat='git status --porcelain'

gcommit () {
    git commit -am "$1"
}

gcp () {
    git commit -am "$1" && gpushcurr
}
