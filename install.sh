#!/bin/bash

# https://nodejs.org/en/download
# https://github.com/ohmybash/oh-my-bash
# https://github.com/junaire/coomer
# https://github.com/ChrisTitusTech/linutil

sudo apt install \
    build-essential libgl1-mesa-dev libx11-dev libxext-dev libxrandr-dev libglu1-mesa-dev freeglut3-dev \
    make gcc ripgrep unzip git xclip curl \
    libasound2-dev libxi-dev libxcursor-dev libxinerama-dev libwayland-dev libxkbcommon-dev \
    xinput brightnessctl flameshot acpi lxqt-powermanagement awesome btop network-manager gimp transmission qemu-system unrar-free vim vlc -y

# nvim: install and config
cp -r .vimrc $HOME/
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
rm nvim-linux-x86_64.tar.gz
git clone https://github.com/llffr/nvim.git --depth=1
read -p "Enter username: " amI
sudo mv nvim/ $HOME/.config/ && sudo chown -R $amI $HOME/.config/nvim/
#nvim: make it available in /usr/local/bin, distro installs to /usr/bin
#ln -sf /opt/nvim-linux64/bin/nvim /usr/local/bin/

# Fonts
curl -LO https://github.com/ryanoasis/nerd-fonts/raw/refs/heads/master/patched-fonts/Iosevka/IosevkaNerdFontMono-Regular.ttf
sudo mkdir /usr/share/fonts/truetype/custom && sudo mv IosevkaNerdFontMono-Regular.ttf /usr/share/fonts/truetype/custom

cat bash.txt >> $HOME/.bashrc
cp -r scripts/ $HOME/
mv .vimrc $HOME/
echo "bash $HOME/scripts/touchpad.sh &" >> $HOME/.profile
sudo cp -r awesome/ $HOME/.config/ && sudo chown -R $amI $HOME/.config/awesome/
g++ coomer.cpp -lGL -lGLU -lX11 -lXrandr -lXext -o coomer
sudo mv coomer /usr/local/bin/ && sudo cp -r jcc /usr/local/bin/

read -p "• Install zig?: y/n: " zigInstall
if [ $zigInstall == "y" ]; then
    if command -v zig > /dev/null 2>&1; then
        echo "Zig installed"
        zig version
    else
        echo "Installing..."
        curl -LO https://ziglang.org/download/0.14.1/zig-x86_64-linux-0.14.1.tar.xz
        tar -xf zig-x86_64-linux-0.14.1.tar.xz && mv zig-x86_64-linux-0.14.1/ .zig-0.14.1/
        mv .zig-0.14.1/ $HOME/
        rm -rf zig-x86_64-linux-0.14.1.tar.xz
        echo -e '\n#ziglang\nexport PATH="$PATH:~/.zig-0.14.1/"' >> $HOME/.bashrc && source $HOME/.bashrc
        echo "=================="
        zig version
    fi
else 
    echo -e "No install\n"
fi

read -p "• Install c3?: y/n: " c3
if [ $c3 == "y" ]; then
    if command -v c3c > /dev/null 2>&1; then
        echo "c3 installed"
        c3c --version
    else
        echo "Installing..."
        curl -LO https://github.com/c3lang/c3c/releases/download/latest-prerelease/c3-linux.tar.gz
        tar -xf c3-linux.tar.gz && mv c3 .c3
        rm -rf c3-linux.tar.gz
        mv .c3/ $HOME/
        echo -e '\n#c3 compiler\nexport PATH="$PATH:~/.c3/"' >> $HOME/.bashrc && source $HOME/.bashrc
        echo "=================="
        c3c --version
    fi
else 
    echo "No install"
fi
