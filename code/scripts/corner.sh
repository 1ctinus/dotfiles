#!/bin/env bash
VARIABLE=$(grep 'corner-radius' ~/.config/picom/picom.conf)
if [ "$VARIABLE" == "corner-radius = 15;" ]; then 
	sed -i 's/corner-radius \= 15/corner-radius = 0/g; s/shadow \= true/shadow = false/g;' ~/.config/picom/picom.conf 
fi
if [ "$VARIABLE" == "corner-radius = 0;" ]; then
	sed -i 's/corner-radius \= 0/corner-radius = 15/g;  s/shadow \= false/shadow = true/g;' ~/.config/picom/picom.conf
fi

