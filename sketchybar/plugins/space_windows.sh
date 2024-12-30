#!/bin/bash

if [ "$SENDER" = "aerospace_workspace_change" ]; then
  prevapps=$(aerospace list-windows --workspace "$PREV_WORKSPACE" | awk -F'|' '{gsub(/^ *| *$/, "", $2); print $2}')
  if [ "${prevapps}" != "" ]; then
    sketchybar --set space.$PREV_WORKSPACE drawing=on
  else
    # if there are no apps in the previous workspace, hide the space
    sketchybar --set space.$PREV_WORKSPACE drawing=off
  fi
fi

if [ "$SENDER" = "aerospace_workspace_change" ] || [ "$SENDER" = "space_windows_change" ] || [ "$SENDER" = "system_woke" ]; then
  # get the focused workspace
  focused_workspace=$(aerospace list-workspaces --focused)
  # get the apps in the focused workspace
  apps=$(aerospace list-windows --workspace "$focused_workspace" | awk -F'|' '{gsub(/^ *| *$/, "", $2); print $2}')
  # set the space to drawing=on
  sketchybar --set space.$focused_workspace drawing=on

  # create the icon strip
  icon_strip=" "
  if [ "${apps}" != "" ]; then
    while read -r app; do
      icon_strip+=" $($CONFIG_DIR/plugins/icon_map_fn.sh "$app")"
    done <<<"${apps}"
  else
    icon_strip=""
  fi

  if [ "$icon_strip" != "" ]; then
    sketchybar --set space.$focused_workspace label="$icon_strip" label.drawing=on icon.padding_right=0
  else
    sketchybar --set space.$focused_workspace label.drawing=off icon.padding_right=12
  fi
fi
