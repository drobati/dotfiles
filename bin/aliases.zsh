#!/usr/bin/env zsh

# this script contains only aliases for my zshrc

# ag
alias ag='ag --color-match '\''1;31'\'''

# git
unalias s
alias g='git'
alias s='git status -s'
alias log='! git log --oneline | emojify | less'

# exa
alias ls='exa'
alias ll='exa -l --git'
alias lt='exa -lT -L 2'

# gitkraken
alias c='gitkraken -p $(pwd)'

# webstorm
ws() {
    local dir
    dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m --height=40%)" && webstorm "${dir}" || return 1
}

# vscode
vs() {
    local dir
    dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m --height=40%)" && code "${dir}" || return 1
}

# open
o() {
    local dir
    dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m --height=40%)" && open "${dir}" || return 1
}

# mvim
unset m
m() {
    local file
    file="$(fasd -Rfl "$1" | fzf -1 -0 --no-sort +m --height=40%)" && mvim "${file}" || return 1
}

# vim
v() {
    local file
    file="$(fasd -Rfl "$1" | fzf -1 -0 --no-sort +m --height=40%)" && vi "${file}" || return 1
}

# cd
z() {
  local dir
  dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m --height=40%)" && cd "${dir}" || return 1
}

# gh
gho() {
    local repo
    repo="$(gh repo list | fzf -1 -0 --no-sort +m --height=40%)" && gh repo view "${repo}" --web || return 1
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
