RED="\033[01;41m"
red="\033[01;31m"
BLU='\033[01;44m'
blu='\033[01;34m'
NLL='\033[01;49m'
nll='\033[01;30m'
CYN='\033[01;46m'
cyn='\033[01;36m'
GRE='\033[01;42m'
gre='\033[01;32m'
YEL='\033[01;103m'
dyl='\033[01;33m'
DYL='\033[01;43m'
MAG='\033[01;105m'
DMG='\033[01;45m'
dmg='\033[01;35m'
WHI='\033[01;107m'
whi='\033[01;37m'
ora='\x1b[48;5;202m'
nonzero_return() {
    printf "$?"
}

parse_git_branch() {
branch="$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/' -e 's/[()]//g ')"
    if [ "$branch" = "" ]; then
    printf ""
    else 
    printf "$(tput setab 172)${whi}   $branch $(tput setaf 172)"
    fi
}
ps1dir() {
    if [ "$PWD" = "/home/james" ]; then
    printf ""
    else 
    printf "${BLU}${whi}  $(printf $PWD  | sed -e 's/\/home\/james/~/g')${blu} "
    fi
}
function prompt_right() {
  printf "${dyl}${whi}${DYL}  \$(nonzero_return) Errors${cyn}${whi}${CYN}   $(date +"%A, %B %d")${dmg}${DMG}${whi}   $(date +"%H:%M")${nll}"
}

function prompt_left() {
    echo -e "\[${nll}${RED}\]\[${whi}\]\u@\h\[${red}$(tput setab 166)\]\[${whi}\] \[$(tput setaf 166)\]\$(parse_git_branch)\$(ps1dir)\[${NLL}\]\[${whi}\033[00m\] "
}
# 

compensate=110
PS1=$(printf "%*s\r%s\n\[ ${nll}${GRE}\]\[${whi}\$\[${gre}${NLL}\]\[${whi}\033[00m\] " "$(($(tput cols)+${compensate}))" "$(prompt_right)" "$(prompt_left)")


