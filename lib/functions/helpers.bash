#!/usr/bin/env bash
#
# Author: Derek Robati
# Email : derek.robati@gmail.com
# Intent: Provides helper functions for common tasks.

function title() {
    printf "\\033]0;%s\\007" "$1"
}

# Install (one or multiple) selected application(s)
# using "brew search" as source input
# mnemonic [B]rew [I]nstall [P]lugin
function bip() {
  local inst=$(brew search | fzf -m)

  if [[ $inst ]]; then
    for prog in $(echo $inst);
    do brew install $prog; done;
  fi
}

# Update (one or multiple) selected application(s)
# mnemonic [B]rew [U]pdate [P]lugin
function bup() {
  local upd=$(brew leaves | fzf -m)

  if [[ $upd ]]; then
    for prog in $(echo $upd);
    do brew upgrade $prog; done;
  fi
}

# Delete (one or multiple) selected application(s)
# mnemonic [B]rew [C]lean [P]lugin (e.g. uninstall)
function bcp() {
  local uninst=$(brew leaves | fzf -m)

  if [[ $uninst ]]; then
    for prog in $(echo $uninst);
    do brew uninstall $prog; done;
  fi
}

function colorize() {
    echo "\\[\033[38;5;$1m\\]"
}

function parse-git-branch() {
  git branch | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

function git-branch-prompt() {
    parse-git-branch 2> /dev/null | sed -e 's/\(.*\)/ (\1)    /'
}


function dad-joke() {
  curl -sS https://icanhazdadjoke.com/
}

function use-python-system() {
  pyenv shell system
}

function use-python-3() {
  pyenv shell 3.7.4
}

function use-python-conda() {
  pyenv shell miniconda3-4.3.30
}

function list-fasd-aliases() {
    echo -e "a\\tfasd -a \\tany"
    echo -e "s\\tfasd -si\\tshow / search / select"
    echo -e "d\\tfasd -d \\tdirectory"
    echo -e "f\\tfasd -f \\tfile"
    echo -e "sd\\tfasd -sid\\tinteractive directory selection"
    echo -e "sf\\tfasd -sif\\tinteractive file selection"
    echo -e "z\\tfasd_cd -d\\tcd, same functionality as j in autojump"
    echo -e "zz\\tfasd_cd -d -i\\tcd with interactive selection"
    echo -e "v\\tf -e mvim\\tquick opening files with macvim"
}