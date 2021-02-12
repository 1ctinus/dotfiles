# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
source code/bash/art.sh
source code/bash/list.sh
source code/bash/readme.sh
source code/bash/haiku.sh
source code/bash/flat.sh
source code/bash/jazz.sh
source 'code/bash/alias.sh'
RED="\033[01;41m"
red="\033[01;31m"
BLU='\033[01;44m'
blu='\033[01;34m'
NLL='\033[01;49m'
nll='\033[01;30m'
CYN='\033[0;106m'
GRE='\033[01;42m'
gre='\033[01;32m'
YEL='\033[0;103m'
MAG='\033[0;105m'
DMG='\033[0;45m'
dmg='\033[0;35m'
WHI='\033[0;107m'
whi='\033[01;37m'
ora='\x1b[48;5;202m'
function ohno {
find  ./ -not -path '*/\.*' -type f -exec sed -i -e 's/::-webkit-scrollbar-thumb:hover/div#container:hover::-webkit-scrollbar/g' {} \;
}
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac
# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion
# if [ "$color_prompt" = yes ]; then
  #  PS1="\033[01;35m${debian_chroot}\033[01;35m\033[01;31m\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$"
#else
 ##   PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '

PS1="\[\033[01;31m\]${debian_chroot}\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
#fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
function reddit {
if [  -z $1 ];
then
xdg-open https://reddit.com
elif [[  -z $2 ]];
then
xdg-open https://reddit.com/r/$1
else
xdg-open "https://reddit.com/r/$1/search?q=$2&restrict_sr=1&sort=top"
fi;
}
function extinfo {
x= curl -s https://fileinfo.com/extension/$1 | grep -o -P '(?<=<\/span>).*(?=<\/h2>)'
printf "$x"
}
function flash {
true= "true"
while :; do
    for (( n = 0; n <= 255; n++ )); do
        printf "$(tput setaf ${n}) $1"
        sleep 0.2
        printf "\r"
    done
    done
}
function rndo {
return $(printf "%7d" $RANDOM)
}
function randcol {
sed -i -- "s/#ffffff/$(rndo)/g" "/home/$USER/.themes/gkjlgsld/yuh!!/gtk-3.0/gtk.css"
}
function lehack {
while :; do
#sleep 0.2
for (( i = 0; i <= 4; i++ )); do   
    printf "%016d" $(echo "obase=2; $RANDOM" | bc)
    done
    printf "\r"
done
}
function 1test {
chars="/-\|"
while :; do
  for (( i=0; i<${#chars}; i++ )); do
    sleep 0.5
    # echo (-en "${chars:$i:1}" "\r")
    test=$(printf "%10s");echo ${test// /(-en "${chars:$i:1}" "\r")}   
  done
done

}
function subsize {
size=$(curl -s https://api.reddit.com/r/"$1" | jq '.data.children[0].data.subreddit_subscribers')
printf "$size\n"
}
function wurtz {
    mpv https://billwurtz.com/"$1".mp3
}
#function ? {
#printf "1ct: print 1ct logo
#grso: find repository file size
#red: red test
#ipsa: add source to 1ct pack
#art: shitty art
#?: prints this message
#reddit: find reddit subreddits
#todo: add stuff todo list
#"
#}
function cpp {
g++ -o "code/cpp/out/$2.out" "code/cpp/$1.cpp"
./code/cpp/out/"$2"
}
function 1ct {
printf "\n"
printf "          ${BLU}            ${NLL}          \n"
printf "        ${GRE}  ${CYN}          ${BLU}  ${NLL}          \n"
printf "      ${RED}  ${YEL}          ${CYN}  ${BLU}  ${NLL}          \n"
printf "      ${RED}          ${YEL}  ${CYN}  ${BLU}  ${NLL}          \n"
for i in {1..6}; do printf "              ${RED}  ${YEL}  ${CYN}  ${BLU}  ${NLL}          \n";done
printf "          ${BLU}    ${MAG}  ${WHI}  ${CYN}  ${BLU}      ${NLL}      \n"
printf "        ${GRE}  ${CYN}    ${WHI}    ${CYN}      ${BLU}  ${NLL}      \n"
printf "      ${RED}  ${YEL}              ${GRE}  ${NLL}        \n"
printf "      ${RED}                ${NLL}          \n"
}
function hacked {
    while :; do
        printf "this desktop has been hacked by Pacc/n"
        sleep 1
    done
}
#ictinus pack source adder
function ipsa {
sed -i "36i \"$1\": {\n\"iconPath\": \"./../images/$1.png\"\n}," "/home/$USER/.vscode/extensions/1ct-pack/fileicons/1ct-icon-theme.json"
}
function grso {
if [[ $1 == https:* ]]
then
uno="$(cut -d'/' -f4 <<<$1)"
dos="$(cut -d'/' -f5 <<<$1)"
else
uno="$(cut -d'/' -f1 <<<$1)"
dos="$(cut -d'/' -f2 <<<$1)"
fi
api="https://api.github.com/repos/$uno/$dos"
printf "$api\n"
fuck=$(curl -s $api | jq '.size')
printf "$(( fuck/1000 ))MB\n"

}
function aa {
echo "alias $1=\"$2\"" >> ~/code/bash/alias.sh
}
# some more ls aliases
# alias ll='ls -alF'
# alias please="sudo"
#alias la='ls -A'
# alias l='ls -CF'
# alias self="code .bashrc"
# alias pack="code code/1ct-pack"
# alias home="cd ~"
# alias getme="sudo apt install"
# alias school="setsid firefox -p Skool"
# alias vim="nvim"
# alias mp4="mpv --no-config --vo=tct $1"
# alias s="sudo"
# alias c="clear"
# alias http="python3 -m http.server 5000"
# alias dirsize="du -sh ./"
# alias shr'=export PS1="\[${nll}${RED}\]\[${whi}\]\u@\h\[${red}$(tput setab 166)\]\[${whi}\] \[$(tput setaf 166)\]\$(parse_git_branch)\$(ps1dir)\[${GRE}\]\[${whi}\] \$\[${gre}${NLL}\]\[${whi}\033[00m\] ";'
function og {
printf "${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$"
}
function btc {
    x= curl -s https://api.coindesk.com/v1/bpi/currentprice.json | jq '.bpi.USD.rate' | sed -e s/\"//g
    printf "$x"
}
function search {
grep -rnw './' -e "$1" --exclude-dir=node_modules --exclude-dir=.git
}
function vimalias {
printf "\ncnoreabbrev $1 e $2" >> ~/.config/nvim/init.vim 
}
function def {
xdg-open https://en.wiktionary.org/wiki/"$1"
}
function mox {
    yuh=(`echo "$1" | grep -o .`)
    for (( i=0; i<${#yuh[@]}; i=i+2 )); do
    s='s'
    yuh[$i]=echo ${s^^}
done
echo "${yuh[@]}"
}
alias 1upt="cd /mnt/c/users/jtgc0/.vscode/extensions/1ct-pack && git pull && cd ~"
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias rest=
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
# source "$HOME/.cargo/env"
source /etc/profile.d/bash_completion.sh
complete -W 'google.com cyberciti.biz nixcraft.com' host
complete -W '"apt install"' s
# source code/bash/ps1.sh
