alias pacman="sudo pacman"

# ~/.bashrc
#
source /home/james/code/bash/art.sh
source /home/james/code/bash/list.sh
source /home/james/code/bash/readme.sh
source /home/james/code/bash/haiku.sh
source /home/james/code/bash/flat.sh
source /home/james/code/bash/jazz.sh
source 'code/bash/alias.sh'
export MANPAGER="nvim -c 'set ft=man' -"
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
PS1="\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
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
function chkfile {
FILE=$1     
if [ -f $FILE ]; then
   echo "File $FILE exists."
else
   echo "File $FILE does not exist."
fi
}
# source /home/james/code/bash/ps1.sh
