#!/usr/bin/env bash
#
# Author: Derek Robati
# Email : derek.robati@gmail.com
# Intent: Provides helper functions for common tasks.

function list-all-helpers() {
  function _echo-title() {
    echo -e "${LT_RED}$1${NC}"
  }

  function _echo-body() {
    echo -e "\\t${LT_GRAY}$1${NC}"
  }

  _echo-title "Work"
  _echo-body "list-work-helpers"

  _echo-title "Config"
  _echo-body "list-config-vars"

  _echo-title "Color"
  _echo-body "list-color-vars"
  _echo-body "list-color-codes"

  _echo-title "Helpers"
  _echo-body "list-fasd-aliases"
}

function list-work-helpers() {

  function _echo-title() {
    echo -e "${LT_RED}$1${NC}"
  }

  function _echo-body() {
    echo -e "\\t${LT_GRAY}$1${NC}"
  }

  _echo-title "Runners"
  _echo-body "run"
}

# Runners

function run() {
  nvm use 12
  npm run start | bunyan
}