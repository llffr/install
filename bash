
#Personal
# touchpad: tap to click, accel speed. Check available props: xinput list-props ID
xinput set-prop "ELAN0712:00 04F3:30FD Touchpad" "libinput Tapping Enabled" 1
xinput set-prop "ELAN0712:00 04F3:30FD Touchpad" "libinput Accel Speed" 0.3
xinput set-prop pointer:"Razer Razer DeathAdder Essential" "libinput Accel Speed" -0.75

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

export PATH="$PATH:/opt/nvim-linux64/bin"
