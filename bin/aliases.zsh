#!/usr/bin/env zsh
# Aliases and functions for zshrc customization
#
# Available Commands:
# - remember   : Display a portion of aliases.zsh (lines 2-3)
# - edit       : Open aliases.zsh in MacVim
# - reload     : Reload aliases.zsh and confirm reload
# - cat        : Use bat for syntax-highlighted cat
# - ag         : Customize ag (silver searcher) color
# - git aliases:
#   - g        : Shortcut for git
#   - s        : Show short git status
#   - log      : One-line git log with emoji support
# - exa aliases:
#   - ls       : Enhanced listing with eza
#   - ll       : Tree listing with eza
# - c          : Open GitKraken in current git directory
# - ws         : Open directory in WebStorm via fasd and fzf
# - vs         : Open directory in VS Code via fasd and fzf
# - o          : Open directory via fasd and fzf
# - m          : Open file in MacVim via fasd and fzf
# - v          : Open file in Vim via fasd and fzf
# - cd alias:
#   - cd       : Uses z (autojump) with enhanced ls output
# - gho        : Open GitHub repo in browser
# - b          : Format clipboard JSON with bunyan
# - kill-port  : Select and kill process listening on a port
# - get_all_paths: Extract JSON paths from clipboard JSON

alias remember='cat -r 4:28 ~/bin/aliases.zsh'
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
