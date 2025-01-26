#!/bin/bash

# coomer is a implementation of [Boomer](https://github.com/tsoding/boomer) in C++.

# sudo apt install build-essential libgl1-mesa-dev libx11-dev libxext-dev libxrandr-dev libglu1-mesa-dev freeglut3-dev make gcc ripgrep unzip git xclip curl xinput brightnessctl flameshot acpi lxqt-powermanagement awesome btop network-manager -y

# https://nodejs.org/en/download

# curl -LO https://cdn.fastly.steamstatic.com/client/installer/steam.deb
# steam installation
# sudo dpkg --add-architecture i386
# sudo apt install libgl1-mesa-glx 
# sudo apt install libgl1-mesa-glx:i386

# curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
# sudo rm -rf /opt/nvim
# sudo tar -C /opt -xzf nvim-linux64.tar.gz
# rm nvim-linux64.tar.gz
# git clone https://github.com/llffr/nvim.git
# sudo mv nvim/ $HOME/.config/

#nvim: make it available in /usr/local/bin, distro installs to /usr/bin
#ln -sf /opt/nvim-linux64/bin/nvim /usr/local/bin/

# cat bash >> $HOME/.bashrc
# sudo cp -r awesome/ $HOME/.config/
# sudo chown -R fernd $HOME/.config/awesome/
# sudo chown -R fernd $HOME/.config/nvim/
# g++ coomer.cpp -lGL -lGLU -lX11 -lXrandr -lXext -o coomer
# sudo mv coomer /usr/local/bin/
# sudo cp -r jcc /usr/local/bin/ 

# curl -fsSL https://christitus.com/linux | sh
