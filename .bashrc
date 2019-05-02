source $HOME/lib/secrets
source $HOME/lib/functions/work.bash
source $HOME/src/tools/mood/start.bash

# bin
export PATH=$HOME/bin:$PATH

# editor
export EDITOR='vim'

# bash completion
#export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
export BASH_COMPLETION_1_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
source $BASH_COMPLETION_1_DIR/git-completion.bash
source $BASH_COMPLETION_1_DIR/git-flow-completion.bash
source $BASH_COMPLETION_1_DIR/tmux

# setup kubectl completion
source <(kubectl completion bash)

source $HOME/lib/functions/secrets.bash

# setup thefuck
eval "$(thefuck --alias)"

# setup fasd
eval "$(fasd --init auto)"

# setup fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

alias v='f -e mvim' # quick opening files with vim

unalias z
function z() {
  local dir
  dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m)" && cd "${dir}" || return 1
}

# setup nvm
#export NVM_DIR=~/.nvm
# shellcheck source=/dev/null
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"

# aliases
alias ls='exa'
alias ll='exa -l --git'
alias lt='exa -lT -L 2'
alias log='! git log --oneline | emojify | less'
alias mvim='open -a MacVim'
alias ag='ag --color-match '\''1;31'\'''

# prompt
git-branch-prompt() {
    parse-git-branch 2> /dev/null | sed -e 's/\(.*\)/ (\1)/'
}
PS1="${LT_RED}\\W${LT_YELLOW}\$(git-branch-prompt) ${LT_BLUE}λ${NC} "
export PS1
