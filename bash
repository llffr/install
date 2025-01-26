
#Personal
# touchpad: tap to click, accel speed. Check available props: xinput list-props ID
xinput set-prop "ELAN0712:00 04F3:30FD Touchpad" "libinput Tapping Enabled" 1
xinput set-prop "ELAN0712:00 04F3:30FD Touchpad" "libinput Accel Speed" 0.45
xinput set-prop pointer:"Razer Razer DeathAdder Essential" "libinput Accel Speed" -0.75

audio=$(pacmd list-sinks | grep index | grep "*" | awk '{print $3}')

alias wifi-restart="sudo service NetworkManager restart"
alias wifi-list="nmcli device wifi list"
alias wifi-connect="nmcli --ask dev wifi connect"
alias wifion="nmcli radio wifi on"
alias wifioff="nmcli radio wifi off"
alias bluetooth-on="sudo systemctl start bluetooth.service"
alias red-status="nmcli dev status"
alias logout="kill -9 -1"
alias suspender="nmcli radio wifi off && sudo systemctl suspend"
alias apagar="nmcli radio wifi off && sudo shutdown now"
alias cspeaker="pacmd set-sink-port ${audio} '[Out] Speaker'"
alias cjack="pacmd set-sink-port ${audio} '[Out] Headphones'"
alias ttrr="xinput --disable 'ELAN0712:00 04F3:30FD Touchpad' && xinput --enable 'ELAN0712:00 04F3:30FD Touchpad'"

export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
