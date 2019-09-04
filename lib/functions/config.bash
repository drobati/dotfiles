#!/usr/bin/env bash
#
# Author: Derek Robati
# Email : derek.robati@gmail.io
# Intent: Config for bash stuff

export HELPERS_DIR=$HOME/lib/functions

# shellcheck disable=SC1090
source "$HELPERS_DIR/color.bash"
source "$HELPERS_DIR/secrets.bash"
source "$HELPERS_DIR/aliases.bash"
source "$HELPERS_DIR/helpers.bash"

function list-config-vars() {
    function _echo_title {
        echo -e "${LT_YELLOW}$1:\\n${NC}"
    }

    function _echo_body {
        echo -e "${LT_RED}\$$1:\\n${LT_GRAY}$2${NC}"
    }

    echo
    _echo_title "VARIABLES"
    _echo_body "HELPERS_DIR" "$HELPERS_DIR"
    _echo_body "TOOLS_ROOT" "$TOOLS_ROOT"
    _echo_body "PRJ_ROOT" "$PRJ_ROOT"
    _echo_body "GH_USERNAME" "$GH_USERNAME"
}

# paths
export PRJ_ROOT=$HOME/src/projects
export TOOLS_ROOT=$HOME/src/tools

# ide
export IDE=vscode

# github
export GH_USERNAME="derek-robati"

# editor
export EDITOR='vim'

# gpg agent
export GPG_TTY=$(tty)

# zlib
export LDFLAGS="-L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"
export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"