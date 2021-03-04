#!/bin/bash
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
source /home/james/code/bash/list.sh
source /home/james/code/bash/readme.sh
source /home/james/code/bash/haiku.sh
source /home/james/code/bash/flat.sh
source /home/james/code/bash/alias.sh
###############################
# Sets manpager to neovim     #
###############################
export MANPAGER="nvim -c 'set ft=man' -"
###############################
# Prompt                      #
###############################
PS1="\[\e[31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
##############################
# Commands                   #
##############################
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
    mpv https://billwurtz.com/"$1".mp3
}
function cpp {
g++ -o "code/cpp/out/$2.out" "code/cpp/$1.cpp"
./code/cpp/out/"$2"
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
# Add -H for curl
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
  mpv "https://billwurtz.com/$(shuf -n 1 ~/code/bash/jazz.txt).mp3"
done
}

function loop {
while :; do
song="$(shuf -n 1 ~/code/bash/wurtz.txt)"
clear >$(tty)
echo -e "$song\n"
  mpv "https://billwurtz.com/${song}.mp3"
done
}
