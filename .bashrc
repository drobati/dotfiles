# token to be moved
export HOMEBREW_GITHUB_API_TOKEN="nope"

# bin
export PATH=$HOME/bin:$PATH

# mysql
export PATH=/usr/local/mysql/bin:$PATH
export PATH=/usr/local/mysql/support-files:$PATH

# verified as fuck
if test -f ~/.gnupg/.gpg-agent-info -a -n "$(pgrep gpg-agent)"; then
    # shellcheck source=/dev/null
    source ~/.gnupg/.gpg-agent-info
    export GPG_AGENT_INFO
else
    eval "$(gpg-agent --daemon --write-env-file ~/.gnupg/.gpg-agent-info)"
fi

# editor
export EDITOR='vim'

# exa
alias ls='exa'
alias ll='exa -l --git'
alias lt='exa -lT -L 2'

# helpful
alias log='! git log --oneline | emojify | less'
alias mvim='open -a MacVim'

# shorthands
alias dc='docker-compose'


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

# setup fasd
eval "$(fasd --init auto)"

# setup nvm
export NVM_DIR=~/.nvm
# shellcheck source=/dev/null
source $(brew --prefix nvm)/nvm.sh

# setup pyenv
eval "$(pyenv init -)"

function use_py_2() {
    pyenv shell 2.7.15
}

function use_py_3() {
    pyenv shell 3.6.4
}

# setup venvw
#export WORKON_HOME=~/.venv
#export VIRTUALENVWRAPPER_PYTHON=/usr/local/opt/python/libexec/bin/python
# shellcheck source=/dev/null
#source /usr/local/bin/virtualenvwrapper.sh

# setup autoenv - i think it drove me crazy
# shellcheck source=/dev/null
#source $(brew --prefix autoenv)/activate.sh

# setup direnv - might need to revisit
#eval "$(direnv hook bash)"

# golang vars
export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# be unique
#random-fortune
echo " "

# thefuck
eval "$(thefuck --alias)"

# bash completion
if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
    # shellcheck source=/dev/null
    source $(brew --prefix)/etc/bash_completion
fi

# Hook for desk activation
# shellcheck source=/dev/null
[ -n "$DESK_ENV" ] && source "$DESK_ENV"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
BROWN='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LT_GRAY='\033[0;37m'
DK_GRAY='\033[1;30m'
LT_RED='\033[1;31m'
LT_GREEN='\033[1;32m'
YELLOW='\033[1;33m'
LT_BLUE='\033[1;34m'
LT_PURPLE='\033[1;35m'
LT_CYAN='\033[1;36m'
WHITE='\033[1;37m'
NC='\033[0m'

function listcolors() {
    echo -e "${BLACK}Black:\\t\\t(0;30);    ${DK_GRAY}Dark Gray:\\t\\t(1;30)${NC}"
    echo -e "${RED}Red:\\t\\t(0;31);    ${LT_RED}Light Red:\\t\\t(1;31)${NC}"
    echo -e "${GREEN}Green:\\t\\t(0;32);    ${LT_GREEN}Light Green:\\t\\t(1;32)${NC}"
    echo -e "${ORANGE}Orange:\\t\\t(0;33);    ${YELLOW}Yellow:\\t\\t(1;33)${NC}"
    echo -e "${BLUE}Blue:\\t\\t(0;34);    ${LT_BLUE}Light Blue:\\t\\t(1;34)${NC}"
    echo -e "${PURPLE}Purple:\\t\\t(0;35);    ${LT_PURPLE}Light Purple:\\t(1;35)${NC}"
    echo -e "${CYAN}Cyan:\\t\\t(0;36);    ${LT_CYAN}Light Cyan:\\t\\t(1;36)${NC}"
    echo -e "${LT_GRAY}Light Gray:\\t(0;37);    ${WHITE}White:\\t\\t(1;37)${NC}"
}

echo -e "${YELLOW}    1. Cover and move.${NC}"
echo -e "${YELLOW}    2. Keep it simple.${NC}"
echo -e "${YELLOW}    3. Prioritize and execute.${NC}"
echo -e "${YELLOW}    4. Decentralize command.${NC}"
echo

