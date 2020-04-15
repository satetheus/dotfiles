# Aliases

alias ls='ls -FA'
alias la='ls -a'
alias ll='ls -al'
alias q='exit'

alias cdd='pushd'
alias b='popd'

alias glog='git log --oneline'
alias gstat='git status --porcelain'
alias gpush='git rev-parse --abbrev-ref HEAD | xargs git push origin'
alias gpull='git rev-parse --abbrev-ref HEAD | xargs git pull origin'
alias gaddnew='git status --short | grep -v "??" | cut -d " " -f 3 | xargs git add'

gcom () {
    git commit -am "$1"
}

gcp () {
    git commit -am "$1" && gpush
}

gclone () {
    git clone https://github.com/$1/$2
}

pyrex () {
    grep -i -r --no-filename --include \*.py 'import ' .
    # alternative is: vim <(grep -r -i  --no-filenames --include \*.py 'import ' .)
}

