#!/usr/local/bin/bash
#
# Author: Derek Robati
# Email : derek.robati@gmail.com
# Intent: Provides helper functions for common tasks.

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

function list-color-codes() {
    echo -e "${BLACK}Black:\\t\\t(0;30);    ${DK_GRAY}Dark Gray:\\t\\t(1;30)${NC}"
    echo -e "${RED}Red:\\t\\t(0;31);    ${LT_RED}Light Red:\\t\\t(1;31)${NC}"
    echo -e "${GREEN}Green:\\t\\t(0;32);    ${LT_GREEN}Light Green:\\t\\t(1;32)${NC}"
    echo -e "${YELLOW}Yellow:\\t\\t(0;33);    ${LT_YELLOW}Light Yellow:\\t(1;33)${NC}"
    echo -e "${BLUE}Blue:\\t\\t(0;34);    ${LT_BLUE}Light Blue:\\t\\t(1;34)${NC}"
    echo -e "${PURPLE}Purple:\\t\\t(0;35);    ${LT_PURPLE}Light Purple:\\t(1;35)${NC}"
    echo -e "${CYAN}Cyan:\\t\\t(0;36);    ${LT_CYAN}Light Cyan:\\t\\t(1;36)${NC}"
    echo -e "${LT_GRAY}Light Gray:\\t(0;37);    ${WHITE}White:\\t\\t(1;37)${NC}"
}

function list-color-vars() {
    echo -e "${BLACK}Gray:\\tBLACK\\t\\t${DK_GRAY}Bold Gray:\\tDK_GRAY${NC}"
    echo -e "${RED}Red:\\tRED\\t\\t${LT_RED}Bold Red:\\tLT_RED${NC}"
    echo -e "${GREEN}Green:\\tGREEN\\t\\t${LT_GREEN}Bold Green:\\tLT_GREEN${NC}"
    echo -e "${YELLOW}Yellow:\\tYELLOW\\t\\t${LT_YELLOW}Bold Yellow:\\tLT_YELLOW${NC}"
    echo -e "${BLUE}Blue:\\tBLUE\\t\\t${LT_BLUE}Bold Blue:\\tLT_BLUE${NC}"
    echo -e "${PURPLE}Purple:\\tPURPLE\\t\\t${LT_PURPLE}Bold Purple:\\tLT_PURPLE${NC}"
    echo -e "${CYAN}Cyan:\\tCYAN\\t\\t${LT_CYAN}Bold Cyan:\\tLT_CYAN${NC}"
    echo -e "${LT_GRAY}White:\\tLT_GRAY\\t\\t${WHITE}Bold White:\\tWHITE${NC}"
}

