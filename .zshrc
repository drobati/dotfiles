source $HOME/bin/secrets.zsh

# bin
export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/opt/gettext/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# vars
export EDITOR='vim'
export GPG_TTY=$TTY

# setup fasd
eval "$(fasd --init auto)"

# setup fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

get-current-git-branch() {
  git rev-parse --abbrev-ref HEAD
}

git-branch-prompt() {
    local branch
    local re
    branch=$(get-current-git-branch 2> /dev/null)
    re="^feature/mxc-([0-9]+)-.*-(master|stable|develop)?$"
    if [[ $branch =~ $re ]]; then
        echo "f/${BASH_REMATCH[2]}-${BASH_REMATCH[1]}"
    else
        get-current-git-branch 2> /dev/null
    fi
}

divide() {
    echo ""
    echo -e "${B_YELLOW}$(hr ${1:-━})${NC}"
    echo ""
}

. "$HOME/.cargo/env"

eval "$(starship init zsh)"

# setup node
export NVM_DIR=~/.nvm
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

unalias z # rebind with fzf
source $HOME/bin/aliases.zsh

eval "$(github-copilot-cli alias -- "$0")"

echo ""
30s r -l c
echo ""
