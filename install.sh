#!/bin/bash

# https://nodejs.org/en/download
# https://github.com/ohmybash/oh-my-bash
# https://github.com/junaire/coomer
# https://github.com/ChrisTitusTech/linutil
set -e

# https://github.com/junaire/coomer
# libgl1-mesa-dev libx11-dev libxext-dev libxrandr-dev libglu1-mesa-dev freeglut3-dev
# make gcc ripgrep unzip git xclip curl 
# libasound2-dev libxi-dev libxcursor-dev libxinerama-dev libwayland-dev libxkbcommon-dev xinput brightnessctl flameshot acpi awesome btop network-manager transmission qemu-system unrar-free vlc ffmpeg jmtpfs

sudo apt install make gcc ripgrep unzip git xclip curl build-essential -y

# nvim install config
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz && rm nvim-linux-x86_64.tar.gz
cat bash.txt >> ~/.bashrc
echo 'export PATH="$PATH:/opt/nvim-linux-x86_64/bin"' >> ~/.bashrc

# Fonts
curl -LO https://github.com/ryanoasis/nerd-fonts/raw/refs/heads/master/patched-fonts/Iosevka/IosevkaNerdFontMono-Regular.ttf
sudo mkdir -p /usr/share/fonts/truetype/custom && sudo mv IosevkaNerdFontMono-Regular.ttf /usr/share/fonts/truetype/custom && sudo fc-cache -fv

# config/
git clone https://github.com/llffr/nvim.git --depth=1
sudo mv nvim/ ~/.config/ && sudo chown -R $(whoami) ~/.config/nvim/
cp -r .vimrc ~/ && sudo cp -r scripts/ /usr/local/bin
mkdir -p ~/Document/virt && mv vm-options.sh ~/Documents/virt
sudo cp -r awesome/ ~/.config/ && sudo chown -R $(whoami) ~/.config/awesome/

# magnify
#g++ coomer.cpp -lGL -lGLU -lX11 -lXrandr -lXext -o coomer
