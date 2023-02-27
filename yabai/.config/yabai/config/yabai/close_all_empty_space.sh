#!/bin/bash

spaces=($(/usr/local/bin/yabai -m query --displays --display | /usr/local/bin/jq '.spaces | @sh' | tr -d '[],"'))

for(( i=${#spaces[@]}-1 ;i>0;i--)) 
do
  space_index=${spaces[i]}
  if [[ -n $space_index && "0" != $space_index ]]; then
    active_window_count=$(/usr/local/bin/yabai -m query --windows --space $space_index | /usr/local/bin/jq 'map(select(."is-sticky" == false)) | length')
    if [[ -n $active_window_count && "0" = $active_window_count ]]; then
      /usr/local/bin/yabai -m space "${space_index}" --destroy
    fi
  fi
done;

osascript -e 'tell application id "tracesOf.Uebersicht" to refresh widget id "simple-bar-index-jsx"'