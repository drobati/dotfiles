source $HOME/lib/secrets
source $HOME/lib/functions/work.bash
source $HOME/src/tools/mood/start.bash

# bin
export PATH=$HOME/bin:$PATH

# editor
export EDITOR='vim'

###############
# COMPLETIONS #
###############

# bash completion
#export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
export BASH_COMPLETION_1_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
source $BASH_COMPLETION_1_DIR/git-completion.bash
source $BASH_COMPLETION_1_DIR/git-flow-completion.bash
source $BASH_COMPLETION_1_DIR/tmux

# setup kubectl completion
source <(kubectl completion bash)

# setup tenant-cli completion
_yargs_completions()
{
    local cur_word args type_list

    cur_word="${COMP_WORDS[COMP_CWORD]}"
    args=("${COMP_WORDS[@]}")

    # ask yargs to generate completions.
    type_list=$(tenant-cli --get-yargs-completions "${args[@]}")

    COMPREPLY=( $(compgen -W "${type_list}" -- ${cur_word}) )

    # if no match was found, fall back to filename completion
    if [ ${#COMPREPLY[@]} -eq 0 ]; then
      COMPREPLY=( $(compgen -f -- "${cur_word}" ) )
    fi

    return 0
}
complete -F _yargs_completions tenant-cli

#########
# TOOLS #
#########

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

############
# LANGUAGE #
############

# setup nvm
#export NVM_DIR=~/.nvm
# shellcheck source=/dev/null
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"

#############
# FUNCTIONS #
#############

title() {
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
