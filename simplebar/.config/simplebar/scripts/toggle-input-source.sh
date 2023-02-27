#!/usr/bin/env bash

current_input_source="$(/usr/local/bin/macism)"
if [ "$current_input_source" != "com.apple.keylayout.ABC" ];
then
  /usr/local/bin/macism com.apple.keylayout.ABC
else
  /usr/local/bin/macism com.xinshuru.inputmethod.FTInput.FTPinyin
fi

osascript -e 'tell application id "tracesOf.Uebersicht" to refresh widget id "simple-bar-index-jsx"'
