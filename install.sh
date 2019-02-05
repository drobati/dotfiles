#!/bin/bash

DOTFILES_ROOT=$HOME/.dotfiles

info () {
  printf "  [ \033[00;34m..\033[0m ] $1"
}

user () {
  printf "\r  [ \033[0;33m??\033[0m ] $1 "
}

success () {
  printf "\r\033[2K  [ \033[00;32mPASS\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [ \033[0;31mFAIL\033[0m ] $1\n"
  echo ''
  exit
}

link () {
  from="$1"
  to="$2"

  rm -f "$to"

  ln -s "$from" "$to"
}

linkfolder () {
  from="$1"
  to="$2"
  name="$3"

  link "$from" "$to"

  if [[ -d $to ]]; then
    success "Linked $name/"
  else
    fail "No $name/"
  fi
}

linkfile () {
  from="$1"
  to="$2"
  name="$3"

  link "$from" "$to"

  if [[ -f $to ]]; then
    success "Linked $name/"
  else
    fail "No $name/"
  fi
}

if [[ -d "$DOTFILES_ROOT" ]]; then
  cd $DOTFILES_ROOT
  info "Symlinking dotfiles from $DOTFILES_ROOT"
else
  fail "$DOTFILES_ROOT does not exist"
  exit 1
fi

linkfolder "$DOTFILES_ROOT/vim" "$HOME/.vim" ".vim"

linkfile "$DOTFILES_ROOT/vim/vimrc" "$HOME/.vimrc" ".vimrc"

linkfile "$DOTFILES_ROOT/.bashrc" "$HOME/.bashrc" ".bashrc"

linkfile "$DOTFILES_ROOT/.bash_profile" "$HOME/.bash_profile" ".bash_profile"

linkfolder "$DOTFILES_ROOT/bin" "$HOME/bin" "bin"

linkfolder "$DOTFILES_ROOT/lib" "$HOME/lib" "lib"

info "Creating typical dir structures."
mkdir -p $HOME/src/projects
mkdir -p $HOME/src/tools

echo ''
