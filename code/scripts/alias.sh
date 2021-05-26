#!/bin/sh
alias ll='ls -alF'
alias pacman="sudo pacman"
alias please="sudo"
alias la='ls -A'
alias ls='ls --color=auto'
alias l='ls -CF'
alias self="code .bashrc"
alias pack="cd .vscode/extensions/1ct-pack"
alias home="cd ~"
alias getme="sudo apt install"
alias school="setsid firefox -p Skool"
alias vim="nvim"
alias webcam="ffplay -hide_banner -loglevel error -input_format mjpeg -video_size 1920x1080 /dev/video0"
# DO: MAKE AS FUNCTION alias mp4="mpv --no-config --vo=tct \$1"
alias s="sudo"
alias c="clear"
#alias ranger="setsid kitty -e ranger"
alias http="python3 -m http.server 5000"
alias ud="rsync -ruLv  ~/code/node-site/data james@\"\$(cat /priv/vps.txt)\":~/node-site --delete"
alias dirsize="du -sh ./"
# SOON TO BE REMOVED 4/2/21 alias shr'=export PS1="\[${nll}${RED}\]\[${whi}\]\u@\h\[${red}$(tput setab 166)\]\[${whi}\] \[$(tput setaf 166)\]\$(parse_git_branch)\$(ps1dir)\[${GRE}\]\[${whi}\] \$\[${gre}${NLL}\]\[${whi}\033[00m\] ";'
alias windows="echo 'cringe'"
alias commit="git commit -m"
alias sud="sudo"
alias pacman="sudo pacman"
alias img="kitty +kitten icat"
alias grep="grep --color=auto"
alias rm="rm -i"
alias beforessh="stty sane; export TERM=linux"
alias sssh="stty sane; export TERM=linux; ssh"
