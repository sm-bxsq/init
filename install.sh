# !/bin/bash

# packages
sudo xbps-install S fish-shell
# shell
sudo chsh -s /bin/fish $USER
cp config.fish /home/$USER/.config/fish/

# flatpak
sudo xbps-install flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo


