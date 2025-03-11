#!/usr/bin/env zsh
# * membeeeeeeer
# *

alias remember='cat -r 2:3 ~/bin/aliases.zsh'
alias edit='mvim ~/bin/aliases.zsh'
alias reload='source ~/bin/aliases.zsh && echo "Aliases reloaded from ~/bin/aliases.zsh"'

# this script contains only aliases for my zshrc
alias cat='bat -p -P'

# ag
alias ag='ag --color-match '\''1;31'\'''

# git
#unalias s #fasd has an alias for s
alias g='git'
alias s='git status -s'
alias log='! git log --oneline | emojify | less'

# exa
alias ls='eza -la --git --git-ignore --color=always --icons=always --group-directories-first -s modified --smart-group'
alias ll='eza -laT -L 2 --git --git-ignore --color=always --icons=always --group-directories-first -s modified --smart-group'

# gitkraken
alias c='open -na 'GitKraken' --args -p $(git rev-parse --absolute-git-dir)'

menu() {
    fzf -1 -0 --no-sort +m --height=40% -q "$1"
}

# webstorm
ws() {
    local dir
    dir="$(fasd -Rdl "$1" | menu "$1")" && webstorm "${dir}" || return 1
}

# vscode
vs() {
    local dir
    dir="$(fasd -Rdl "$1" | menu "$1")" && code "${dir}" || return 1
}

# open
o() {
    local dir
    dir="$(fasd -Rdl "$1" | menu "$1")" && open "${dir}" || return 1
}

# mvim
unset m
m() {
    local file
    file="$(fasd -Rfl "$1" | menu "$1")" && mvim "${file}" || return 1
}

# vim
v() {
    local file
    file="$(fasd -Rfl "$1" | menu "$1")" && vi "${file}" || return 1
}

# cd
#unalias z # rebind with fzf
#z() {
#  local dir
#  dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m --height=40%)" && cd "${dir}" || return 1
#}
alias cd='z'

## Had the idea to ls everytime I z.
z() {
    j "$1" || return
    eza -Dl
}

# gh
gho() {
    local repo
    repo="$(gh repo list | menu "$1")" && gh repo view "${repo}" --web || return 1
}

# bunyan
alias b='pbpaste | bunyan -o short'

# general
kill-port() {
    local port
    port="$(lsof -iTCP -sTCP:LISTEN -n -P | fzf -1 -0 --no-sort +m --height=40% | awk '{print $9}' | awk -F':' '{print $2}')" && kill -9 $(lsof -t -i:${port}) || return 1
}

get_all_paths() {
    pbpaste | jq '[path(..)|map(if type=="number" then "[]" else tostring end)|join(".")|split(".[]")|join("[]")]|unique|map("."+.)|.[]'
}
