#!/bin/zsh
###############################
# _      _   _
#/ | ___| |_(_)_ __  _   _ ___
#| |/ __| __| | '_ \| | | / __|
#| | (__| |_| | | | | |_| \__ \
#|_|\___|\__|_|_| |_|\__,_|___/
###############################
# 1ctinus dotfiles
# 2020-2021
###############################
#  other files                #
###############################
source /home/james/code/scripts/list.sh
source /home/james/code/scripts/readme.sh
source /home/james/code/scripts/haiku.sh
source /home/james/code/scripts/flat.sh
source /home/james/code/scripts/alias.sh


###############################
# Sets manpager to neovim     #
###############################
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
###############################
# Prompt                      #
##############################

PS1="%F{red}%B%n@%m%F{4}%~%F{null}%% "

##############################
# Commands                   #
##############################
# zsh-syntax-highlighting zsh-autosuggestions
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.oh-my-zsh/plugins/command-not-found/command-not-found.plugin.zsh


pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish
### Fix slowness of pastes

#source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=245,normal"
#export ZSH=$HOME/.oh-my-zsh
#source $ZSH/oh-my-zsh.sh
setopt correct
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==34=34}:${(s.:.)LS_COLORS}")';
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward


bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
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
cursedcat() {
setsid aplay ~/Music/banger.wav d > /dev/null 2>&1
cat $*
}
function rndo {
return $(printf "%7d" $RANDOM)
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
# TODO: ADD -H to curl and make jq -r
function subsize {
size=$(curl -s https://api.reddit.com/r/"$1" | jq '.data.children[0].data.subreddit_subscribers')
printf "$size\n"
}
function wurtz {
    mpv --vo=tct https://billwurtz.com/"$1".mp3
}
wurtz-wave() {
 mpv --speed=0.84  --audio-display=no --no-audio-pitch-correction "https://billwurtz.com/$1.mp3"
}
function cpp {
g++ -o "code/cpp/out/$2.out" "code/cpp/$1.cpp"
./code/cpp/out/"$2"
}
# for xterm cursor
if [[ $(printf $(ps -p $(ps -p $$ -o ppid=) o args=)) == "xterm" ]]; then echo -e -n "\x1b[\x35 q"; fi
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
fuck=$(curl -sH "User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36" $api | jq '.size')
printf "$(( fuck/1000 ))MB\n"

}
function pettyedit {
nvim ~/code/node-site/$1 &&
scp ~/code/node-site/$1 scp://james@server//home/james/node-site/$1
}
# add alias
function aa {
echo "alias $1=\"$2\"" >> ~/code/scripts/alias.sh
}
# Add -H for curl

function search {
grep -rnw './' -e "$1" --exclude-dir=node_modules --exclude-dir=.git
}
function vimalias {
printf "\ncnoreabbrev $1 e $2" >> ~/.config/nvim/init.vim 
}
function def {
xdg-open https://en.wiktionary.org/wiki/"$1"
}
function chkfile {
FILE=$1     
if [ -f $FILE ]; then
   echo "File $FILE exists."
else
   echo "File $FILE does not exist."
fi
}
function jazz {
while :; do
  mpv "https://billwurtz.com/$(shuf -n 1 ~/code/scripts/jazz.txt).mp3"
done
}

function loop {
while :; do
song="$(shuf -n 1 ~/code/scripts/wurtz.txt)"
clear
echo -e "$song\n"
  mpv "https://billwurtz.com/${song}.mp3"
done
}
if [[ -n ${terminfo[smkx]} ]] && [[ -n ${terminfo[rmkx]} ]]; then
        function zle-line-init () {echoti smkx}
        function zle-line-finish () {echoti rmkx}

        zle -N zle-line-init
        zle -N zle-line-finish
fi
 zshaddhistory() { whence ${${(z)1}[1]} >| /dev/null || return 1 }
bindkey '\xffe4' autosuggest-accept
#echo "zsh on $TERM: $(cat ~/code/scripts/splash.txt | shuf -n 1)"
#printf "$(/usr/bin/pacman -Qu) updates available\n"
#printf '=%.s' {1..$(tput cols)}
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
export PYTHONSTARTUP=~/.pyrc
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
