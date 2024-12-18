#!/usr/bin/env zsh

update_space() {
    SPACE_ID=$(echo "$INFO" | jq -r '."display-1"')

    case $SPACE_ID in
    1)
        ICON=
        ICON_PADDING_LEFT=8
        ICON_PADDING_RIGHT=8
        ;;
    *)
        ICON=$SPACE_ID
        ICON_PADDING_LEFT=12
        ICON_PADDING_RIGHT=12
        ;;
    esac

    sketchybar --set $NAME \
        icon=$ICON \
        icon.padding_left=$ICON_PADDING_LEFT \
        icon.padding_right=$ICON_PADDING_RIGHT
}

case "$SENDER" in
"mouse.clicked")
    # Reload sketchybar
    sketchybar --remove '/.*/'
    source $HOME/.config/sketchybar/sketchybarrc
    ;;
*)
    update_space
    ;;
esac
