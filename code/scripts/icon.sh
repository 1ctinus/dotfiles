#!/usr/bin/env bash

SCRIPT_FOLDER="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
export DISPLAY=":1"
export PATH="$PATH:/snap/bin"

function change_icon() {
  for id in $(DISPLAY=":1" xdotool search --onlyvisible "$1" 2>/dev/null); do
    xseticon -id "${id}" "$2"
  done
}

change_icon application_name "${SCRIPT_FOLDER}/application_name.png"

