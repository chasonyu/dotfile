#!/bin/sh
title=$(yabai -m query --windows --window ${YABAI_WINDOW_ID} | jq .title | cut -d [ -f 2 | cut -d ] -f 1)
title="${title/\~/$HOME}"
if [ "$title" == "." ]; then
  absolute=$(pwd)
elif [ "$title" == ".." ]; then
  absolute=$(dirname "$(pwd)")
else
  absolute=$(cd "$(dirname "$title")"; pwd)/$(basename "$title")
fi
if [ -e $absolute ];then
  yabai -m window ${YABAI_WINDOW_ID} --toggle float
fi
