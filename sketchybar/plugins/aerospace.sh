#!/usr/bin/env bash

# make sure it's executable with:
# chmod +x ~/.config/sketchybar/plugins/aerospace.sh

if [ "$SENDER" = "aerospace_workspace_change" ]; then
  if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME background.border_width=2 background.border_color=0xFFFFFFFF icon.color=0xFFFFFFFF label.color=0xFFFFFFFF
  else
    sketchybar --set $NAME background.border_width=1 background.border_color=0x88FFFFFF icon.color=0x88FFFFFF label.color=0x88FFFFFF
  fi
fi

if [ "$SENDER" = "aerospace_mode_change" ]; then
  if [ "$MODE" = "MAIN" ]; then
    sketchybar --set "$NAME" drawing=off
    sketchybar --bar color=0x00000000
  else
    sketchybar --set "$NAME" label="$MODE" drawing=on
    sketchybar --bar color=0xFFdc2626
  fi
fi
