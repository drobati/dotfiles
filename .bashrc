# token to be moved
export HOMEBREW_GITHUB_API_TOKEN="78910a5b3a7883f231f391467c8d308fbe007020"

# bin
export PATH=$HOME/bin:$PATH
#export PATH=$HOME/.local/bin:$PATH

# editor
export EDITOR='vim'

# exa
alias ls='exa'
alias ll='exa -l --git'
alias lt='exa -lT -L 2'

# helpful
alias log='! git log --oneline | emojify | less'
alias mvim='open -a MacVim'
alias safari='open -a Safari'

# shorthands
alias dc='docker-compose'
alias g='git'


# for prompt later
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

title() {
    printf "\\033]0;%s\\007" "$1"
}

# prompt
PS1="\\[\\033[1;31m\\]\\W\\[\\033[1;33m\\]\$(parse_git_branch) \\[\\033[1;34m\\]λ\\[\\033[0m\\] "
export PS1

<<<<<<< Updated upstream
# bash completion
export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
=======
export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

>>>>>>> Stashed changes

# setup thefuck
eval "$(thefuck --alias)"

# setup fasd
eval "$(fasd --init auto)"
alias v='f -e mvim' # quick opening files with vim

function fasd_aliases() {
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

# setup fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Language setups

# setup nvm
#export NVM_DIR=~/.nvm
# shellcheck source=/dev/null
#source $(brew --prefix nvm)/nvm.sh

# setup venvw
#export WORKON_HOME=~/.venv
#export VIRTUALENVWRAPPER_PYTHON=/usr/local/opt/python/libexec/bin/python
# shellcheck source=/dev/null
#source /usr/local/bin/virtualenvwrapper.sh

# golang vars
#export GOPATH=$HOME/go
#export GOROOT=/usr/local/opt/go/libexec
#export PATH=$PATH:$GOPATH/bin
#export PATH=$PATH:$GOROOT/bin

# be unique
#random-fortune
echo " "

BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LT_GRAY='\033[0;37m'
DK_GRAY='\033[1;30m'
LT_RED='\033[1;31m'
LT_GREEN='\033[1;32m'
LT_YELLOW='\033[1;33m'
LT_BLUE='\033[1;34m'
LT_PURPLE='\033[1;35m'
LT_CYAN='\033[1;36m'
WHITE='\033[1;37m'
NC='\033[0m'

function listcolors() {
    echo -e "${BLACK}Black:\\t\\t(0;30);    ${DK_GRAY}Dark Gray:\\t\\t(1;30)${NC}"
    echo -e "${RED}Red:\\t\\t(0;31);    ${LT_RED}Light Red:\\t\\t(1;31)${NC}"
    echo -e "${GREEN}Green:\\t\\t(0;32);    ${LT_GREEN}Light Green:\\t\\t(1;32)${NC}"
    echo -e "${YELLOW}Yellow:\\t\\t(0;33);    ${LT_YELLOW}Light Yellow:\\t\\t(1;33)${NC}"
    echo -e "${BLUE}Blue:\\t\\t(0;34);    ${LT_BLUE}Light Blue:\\t\\t(1;34)${NC}"
    echo -e "${PURPLE}Purple:\\t\\t(0;35);    ${LT_PURPLE}Light Purple:\\t(1;35)${NC}"
    echo -e "${CYAN}Cyan:\\t\\t(0;36);    ${LT_CYAN}Light Cyan:\\t\\t(1;36)${NC}"
    echo -e "${LT_GRAY}Light Gray:\\t(0;37);    ${WHITE}White:\\t\\t(1;37)${NC}"
}

echo -e "${LT_YELLOW}    Get Shit Done.${NC}"
echo

source $HOME/lib/functions/work.sh


