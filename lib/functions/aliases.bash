#!/usr/bin/env bash
#
# Author: Derek Robati
# Email : derek.robati@gmail.io
# Intent: Alias of paths to projects.

alias reload='source $HOME/.bash_profile'

# exa
alias ls='exa'
alias ll='exa -l --git'
alias lt='exa -lT -L 2'

# helpful
alias log='! git log --oneline | emojify | less'
alias mvim='open -a MacVim'
alias safari='open -a Safari'
alias dc='docker-compose'
alias g='git'