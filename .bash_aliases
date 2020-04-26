# Aliases

alias ls='ls -FA'
alias la='ls -a'
alias ll='ls -al'
alias q='exit'

alias cdd='pushd'
alias b='popd'
alias r='exec bash -l'
alias dcs='cd /mnt/c/$userprofile/Documents'
alias dot='cd ~/dotfiles'

alias fig='vim $(fzf --height=40%)'

alias glog='git log --oneline'
  alias golg='glog'
alias gstat='git status --porcelain'
  alias gast='gstat'
  alias gsta='gstat'
  alias gstot='gstat'
alias gpush='git rev-parse --abbrev-ref HEAD | xargs git push origin'
  alias gpshu='gpush'
alias gpull='git rev-parse --abbrev-ref HEAD | xargs git pull origin'
  alias gpul='gpull'
  alias pgull='gpull'
  alias pgul='gpull'
alias gaddnew='git status --short | grep -v "??" | cut -d " " -f 3 | xargs git add'
  alias gtnew='gaddnew'
  alias gtn='gaddnew'

gcom () {
    git commit -am "$1"
}

gcp () {
    git commit -am "$1" && gpush
}
  alias gpc='gcp'

gclone () {
    git clone https://github.com/$1/$2
}

g2https () {
}

g2ssh() {
}

preqs () {
    grep -i -r --no-filename --include \*.py 'import ' . | \
    sed -E 's/from (.*) import .*/import \1/;s/#.*//;s/import (\S*).*/\1/;s/\..*//' | \
    sort -u >> \
    $1
}

srp () {
    if [ $# -eq 2 ]
    then
        grep -rl "${1}" . | xargs sed -i "s/${1}/${2}/g"
        #alternate: find /path/to/files -type f -exec sed -i 's/oldstring/new string/g' {} \;
    fi

    if [ $# -eq 3 ]
    then
        grep -rl --include ${3} "${1}" . | xargs sed -i "s/${1}/${2}/g"
    fi
}

srd () {
    if [ $# -eq 1 ]
    then
        grep -rl "${1}" . | xargs sed -i "/${1}/d"
    fi

    if [ $# -eq 2 ]
    then
        grep -rl --include ${2} "${1}" . | xargs sed -i "/${1}/d"
    fi
}

