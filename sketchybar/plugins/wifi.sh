#!/usr/bin/env sh

INFO="$(system_profiler SPAirPortDataType | awk '/Current Network/ {getline;$1=$1;print $0 | "tr -d ':'";exit}'
)"

if [ "$INFO" = "" ]; then
  sketchybar --set $NAME label="Disconnected" icon=󱚵
else
  sketchybar --set $NAME label="$INFO" icon=󰖩
fi