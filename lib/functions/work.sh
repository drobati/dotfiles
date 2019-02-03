#!/bin/sh

#
# Author: Derek Robati
# Email : derek.robati@gmail.com
# Intent: Provides helper functions for common tasks.

export WORK_DIR=$HOME/src/projects/company
export PRJ_DIR=$WORK_DIR/project

export VARIABLE=""

# PROJECT TEMPLATE

function setup_project() {
    cd "$PRJ_DIR" || exit
    npm config set namespace:variable $VARIABLE
}

function build_project() {
    setup_prj
    echo "SOME BUILD COMMAND"
}

function run_project() {
    setup_prj
    echo "SOME RUN COMMAND"
}
