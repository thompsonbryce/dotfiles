#!/bin/env bash
#
dnf update

# add lazy git copr repo
echo "Enabling lazygit copr"
dnf copr enable atim/lazygit -y

# install
echo "Installing packages from package manager"
dnf install -y \
    blueman \
    neovim \
    git \
    tmux \
    gcc-c++ \
    gnome-shell-extension-pop-shell \
    keepassxc \
    steam \
    rclone \
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
    keepassxc \
    steam \
    rclone \
    stow \


echo "installing flatpaks"
flatpak install -y com.discordapp.Discord
flatpak install -y flathub org.gnome.Extensions
flatpak install -y flathub org.keepassxc.KeePassXC
flatpak install -y flathub com.microsoft.AzureStorageExplorer

echo "Configuring tmux tpm"
git clone https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm

# Install ffmpeg
echo "Enabling RPM Fusion free/nonfree repositories"
dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

echo "Installing ffmpeg"
dnf -y install ffmpeg --allowerasing

chmod +x ~/dev/tmux-sessionizer

echo "Installing oh my posh
curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ~/bin
