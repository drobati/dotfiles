#!/bin/bash

DOTFILES_ROOT=$HOME/.dotfiles

info () {
  printf "  [ \033[00;34m..\033[0m ] $1"
}

user () {
  printf "\r  [ \033[0;33m??\033[0m ] $1 "
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

link () {
  from="$1"
  to="$2"
  rm -f "$to"
  ln -s "$from" "$to"
}

cd $DOTFILES_ROOT

if [[ -d "$DOTFILES_ROOT" ]]; then
  info "Symlinking dotfiles from $DOTFILES_ROOT"
else
  fail "$DOTFILES_ROOT does not exist"
  exit 1
fi

link "$DOTFILES_ROOT/vim" "$HOME/.vim"

if [[ -d "$HOME/.vim" ]]; then
  success "Linked .vim/"
else
  fail "No .vim/"
fi

link "$DOTFILES_ROOT/vim/vimrc" "$HOME/.vimrc"

if [[ -f "$HOME/.vimrc" ]]; then
  success "Linked .vimrc"
else
  fail "No .vimrc"
fi
