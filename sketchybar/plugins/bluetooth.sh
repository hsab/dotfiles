#!/bin/bash

update_bluetooth() {
  # Get Bluetooth status using blueutil
  BLUETOOTH_STATUS=$(blueutil -p)
  
  if [ "$BLUETOOTH_STATUS" = "1" ]; then
    sketchybar --set $NAME icon="" icon.color=0x99ffffff
  else
    sketchybar --set $NAME icon="" icon.color=0x99ffffff
  fi
}

mouse_clicked() {
  # Toggle Bluetooth
  if [ "$BUTTON" = "left" ]; then
    BLUETOOTH_STATUS=$(blueutil -p)
    if [ "$BLUETOOTH_STATUS" = "1" ]; then
      blueutil -p 0
    else
      blueutil -p 1
    fi
  fi
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked
    ;;
  *) update_bluetooth
    ;;
esac
