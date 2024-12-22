#!/bin/bash

#sudo apt install build-essential libgl1-mesa-dev libx11-dev libxext-dev libxrandr-dev libglu1-mesa-dev freeglut3-dev make gcc ripgrep unzip git xclip curl xinput brightnessctl flameshot acpi lxqt-powermanagement awesome neofetch gdebi gimp btop -y

: '
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
curl -LO https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.deb
curl -LO https://cdn.fastly.steamstatic.com/client/installer/steam.deb
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz
sudo cp -r nvim/ $HOME/.config/
sudo gdebi jdk-21_linux-x64_bin.deb
rm jdk-21_linux-x64_bin.deb
'

#nvim: make it available in /usr/local/bin, distro installs to /usr/bin
#ln -sf /opt/nvim-linux64/bin/nvim /usr/local/bin/

#cat bash >> $HOME/.bashrc
#sudo cp -R awesome/ $HOME/.config/

: '
sudo chown -R fernd $HOME/.config/awesome/*
sudo chown -R fernd $HOME/.config/nvim/*
g++ coomer.cpp -lGL -lGLU -lX11 -lXrandr -lXext -o coomer
sudo mv coomer /usr/local/bin/
sudo cp -r jcc /usr/local/bin/ 
'

: '
pacmd list-sinks
pacmd set-sink-port 3 "[Out] Speaker"
pacmd set-sink-port 3 "[Out] Headphones"
'

#curl -fsSL https://christitus.com/linux | sh
