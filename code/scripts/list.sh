#!/bin/bash
function list {
case $1 in
add | a)
echo "$2">> ~/.config/list/"$3".txt
;;
rem | remove | del | rm)
sed -i "$2d" ~/.config/list/"$3".txt
;;
"" | "open")
cat -n ~/.config/list/"$2".txt
;;
list )
find ~/.config/list -maxdepth 1 | sed -e 's/.txt//g'
;;
all )
shopt -s dotglob && cat -n ~/.config/list/*
;;
help | "?" )
printf "bash list editor
made by 1ctinus, since 2021
add: add point to a list
rem: delete point off a list
open: print a specific list
list: list all lists
all: print every point of all lists\n"
esac
}
