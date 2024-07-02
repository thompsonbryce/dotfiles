#!/bin/bash
#

# add lazy git copr repo
echo "Enabling lazygit copr"
sudo dnf copr enable atim/lazygit -y

# install
echo "Installing packages from package manager"
sudo dnf install -y \
    neovim \
    git \
    tmux \
    nitrogen \
    dotnet-sdk-8.0 \
    htop \
    gimp \
    neofetch \
    lazygit \
    fontawesome-fonts \
    flatpak \
    nodejs \
    libreoffice.x86_64 \
    tmux \
    gcc-c++ \
    gnome-shell-extension-pop-shell \
    keepass-xc \
    steam \
    rclone

echo "installing flatpaks"
flatpak install -y com.discordapp.Discord
flatpak install -y flathub org.gnome.Extensions
flatpak install -y flathub org.keepassxc.KeePassXC
flatpak install -y flathub com.microsoft.AzureStorageExplorer

echo "Configuring tmux tpm"
git clone https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm

# Install ffmpeg
echo "Enabling RPM Fusion free/nonfree repositories"
sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

echo "Installing ffmpeg"
sudo dnf -y install ffmpeg --allowerasing

chmod +x ~/dev/tmux-sessionizer
