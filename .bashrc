source $HOME/lib/functions/config.bash

# bin
export PATH=$HOME/bin:$PATH
export PATH="/usr/local/opt/gettext/bin:$PATH"

# bash completion
#export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
export BASH_COMPLETION_1_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
source $BASH_COMPLETION_1_DIR/git-completion.bash
source $BASH_COMPLETION_1_DIR/tmux

# setup thefuck
eval "$(thefuck --alias)"

# setup fasd
eval "$(fasd --init auto)"
alias v='f -e mvim' # quick opening files with vim

# setup fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
unalias z # rebind with fzf
function z() {
  local dir
  dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m)" && cd "${dir}" || return 1
}

# Language setups

# setup node
export NVM_DIR=~/.nvm
# shellcheck source=/dev/null
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"

# setup python
if command -v pyenv 1>/dev/null 2>&1; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# golang vars
#export GOPATH=$HOME/go
#export GOROOT=/usr/local/opt/go/libexec
#export PATH=$PATH:$GOPATH/bin
#export PATH=$PATH:$GOROOT/bin

# prompt
PS1="$(colorize 1)drobati@work    "
PS1="$PS1$(colorize 2)\\W    "
PS1="$PS1$(colorize 3)\$(git-branch-prompt)"
PS1="$PS1\n$(colorize 4)λ\\[${NC}\\] "
export PS1

echo ""
30s r -l c
echo ""

