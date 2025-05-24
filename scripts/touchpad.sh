#!/bin/bash

# xinput. Check available props: xinput list-props ID

TOUCHPAD_NAME="ELAN0712:00 04F3:30FD Touchpad"
MOUSE_NAME="Razer Razer DeathAdder Essential"

# check if device exists
device_exists() {
    xinput list | grep -Fq "$1"
}

# Configure touchpad
if device_exists "$TOUCHPAD_NAME"; then
    echo "Configuring touchpad: $TOUCHPAD_NAME"
    xinput set-prop "$TOUCHPAD_NAME" "libinput Tapping Enabled" 1
    xinput set-prop "$TOUCHPAD_NAME" "libinput Accel Speed" 0.45

    echo "Resetting touchpad to apply changes..."
    xinput --disable "$TOUCHPAD_NAME"
    sleep 0.5
    xinput --enable "$TOUCHPAD_NAME"
else
    echo "Touchpad not found: $TOUCHPAD_NAME"
fi

# Configure mouse
if device_exists "$MOUSE_NAME"; then
    echo "Configuring mouse: $MOUSE_NAME"
    xinput set-prop "pointer:$MOUSE_NAME" "libinput Accel Speed" -0.75
else
    echo "Mouse not found: $MOUSE_NAME"
fi
