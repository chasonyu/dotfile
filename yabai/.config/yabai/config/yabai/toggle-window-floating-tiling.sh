#!/usr/bin/env bash

# Toggle a window between floating and tiling.
# Only works when the workspace layout is bsp, i.e., the windows in it are tiled.

# Step-1:
# First add the snippet below in your yabairc to make sure that each time yabai starts, the temporary folder will be recreated.

# tempDir=/tmp/yabai-tiling-floating-toggle
# [ -d $tempDir ] && rm -rf $tempDir
# mkdir $tempDir

# Step-2:
# Bind a key to this script like alt - t : ~/.config/yabai/scripts/toggle-window-floating-tiling.sh.

spaceType=$(/usr/local/bin/yabai -m query --spaces --space | /usr/local/bin/jq .type)
if [ $spaceType = '"bsp"' ]; then

  read -r id floating <<< $(echo $(/usr/local/bin/yabai -m query --windows --window | /usr/local/bin/jq '.id, ."is-floating"'))
  tmpfile=/tmp/yabai-tiling-floating-toggle/$id

  # border=$(yabai -m config window_border)

  # If the window is floating, record its position and size into a temp file and toggle it to be tiling.
  if [[ $floating = true ]]
  then
    [ -e $tmpfile ] && rm $tmpfile
    echo $(/usr/local/bin/yabai -m query --windows --window | /usr/local/bin/jq .frame) >> $tmpfile
    /usr/local/bin/yabai -m window --toggle float
    # [ $border = 'on' ] && yabai -m window --toggle border

  # If the window is tiling, toggle it to be floating.
  # If it is floating before, restore its previous position and size. Otherwise, place
  # the floating window to the center of the display. (Its position and size have been
  # calculated and stored in temp files (based on the different sizes of monitors) when
  # yabai is initialized. See yabairc)
  else
    /usr/local/bin/yabai -m window --toggle float
    # [ $border = 'on' ] && yabai -m window --toggle border
    if [ -e $tmpfile ]
    then
      read -r x y w h <<< $(echo $(cat $tmpfile | /usr/local/bin/jq '.x, .y, .w, .h'))
      /usr/local/bin/yabai -m window --move abs:$x:$y
      /usr/local/bin/yabai -m window --resize abs:$w:$h
      rm $tmpfile
    else
      display=$(/usr/local/bin/yabai -m query --windows --window | /usr/local/bin/jq .display)
      . /tmp/yabai-tiling-floating-toggle/display-$display
      /usr/local/bin/yabai -m window --move abs:$x:$y
      /usr/local/bin/yabai -m window --resize abs:$w:$h
    fi
  fi

fi