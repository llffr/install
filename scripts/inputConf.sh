#!/bin/bash

set -e

# xinput. Check available props: xinput list-props ID
TOUCHPAD_NAME="ELAN0712:00 04F3:30FD Touchpad"
MOUSE_NAME="Razer Razer DeathAdder Essential"

device_exists() {
    xinput list | grep -Fq "$1"
}

if device_exists "$TOUCHPAD_NAME"; then
    xinput set-prop "$TOUCHPAD_NAME" "libinput Tapping Enabled" 1
    xinput set-prop "$TOUCHPAD_NAME" "libinput Accel Speed" 0.45

    xinput --disable "$TOUCHPAD_NAME"
    xinput --enable "$TOUCHPAD_NAME"
else
    echo "Touchpad not found: $TOUCHPAD_NAME"
fi

if device_exists "$MOUSE_NAME"; then
    xinput set-prop "pointer:$MOUSE_NAME" "libinput Accel Speed" -0.75
else
    echo "Mouse not found: $MOUSE_NAME"
fi
