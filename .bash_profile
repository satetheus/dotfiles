# Aliases

alias gpushcurr='git rev-parse --abbrev-ref HEAD | xargs git push origin'

gcommit () {
    git commit -am "$1"
}
