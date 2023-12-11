#!/bin/bash
#

# add lazy git copr repo
sudo nf copr enable atim/lazygit -y

# install
sudo dnf install -y neovim git tmux nitrogen dotnet-sdk-8.0  htop gimp neofetch lazygit fontawesome-fonts flatpak nodejs libreoffice.x86_64 tmux gcc-c++ gnome-shell-extension-pop-shell keepass-xc

flatpak install -y com.discordapp.Discord
flatpak install -y flathub org.gnome.Extensions
flatpak install -y flathub org.keepass.KeePassXC

echo "Configuring tmux tpm"
git clone https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm
