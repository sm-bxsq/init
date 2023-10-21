#!/bin/bash
# Automate the process of setting up Void Linux

bypass() {
  sudo -v
  while true;
  do
    sudo -n true
    sleep 45
    kill -0 "$$" || exit
  done 2>/dev/null &
}

echo "Updating Repos..."
sleep 3s
	sudo xbps-install -Syu
	sudo xbps-install -Sy void-repo-nonfree

clear
echo "Installing packages..."
sleep 3s
	# XFCE4
	sudo xbps-install xfce4-clipman-plugin xfce4-panel xfce4-panel-appmenu xfce4-pulseaudio-plugin xfce4-screenshooter xfce4-session xfce4-settings xfce4-taskmanager xfce4-terminal Thunar thunar-volman thunar-archive-plugin thunar-media-tags-plugin xfwm4 xfdesktop gvfs gvfs-mtp gvfs-gphoto2 xfce-polkit xdg-utils xdotool paper-icon-theme
  #Xorg
  sudo xbps-install -Sy xorg-minimal xf86-video-amdgpu xf86-input-libinput xinit
# Fonts
	sudo xbps-install -Sy font-hack-ttf fontconfig  freetype google-fonts-ttf noto-fonts-emoji noto-fonts-ttf nerd-fonts font-awesome
	# General graphics drivers
	sudo xbps-install -Sy vkd3d vulkan-loader  
	# AMD drivers
	sudo xbps-install -Sy linux-firmware-amd xf86-video-amdgpu mesa-ati-dri mesa-vulkan-radeon	mesa-vulkan
#XFCE4 panels / docks / appmenus
	sudo xbps-install -Sy appmenu-gtk-module appmenu-gtk3-module plank polybar rofi
	#Linux Headers
	sudo xbps-install -Sy linux-headers linux-lts-headers
  # Build essentials
	sudo xbps-install -Sy linux-tools gcc ctags make cmake rsync git lynx base-devel cargo rust meson sassc nodejs lazygit github-cli build ninja 
	#other
	sudo xbps-install -Sy octoxbps
	sudo xbps-install -Sy socklog-void
	sudo xbps-install -Sy dconf-editor
	sudo xbps-install -Sy android-file-transfer-linux
	sudo xbps-install -Sy amdvlk
  sudo xbps-install -Sy openjdk-jre

echo "Configuring system...

	sudo rm -f /var/service/agetty-tty{3,4,5,6}
	sudo ln -s /etc/sv/ntpd /var/service/
	sudo ln -s /etc/sv/dbus /var/service/
	sudo ln -s /etc/sv/elogind /var/service/
	sudo ln -s /etc/sv/polkitd /var/service/
	#sudo ln -s /etc/sv/ufw /var/service/
	#sudo ln -s /etc/sv/cupsd /var/service/
	#sudo ln -s /etc/sv/uuidd /var/service/
	sudo ln -s /etc/sv/alsa /var/service/
	#sudo ln -s /etc/sv/libvirtd /var/service/
	#sudo ln -s /etc/sv/virtlogd /var/service/
	#sudo ln -s /etc/sv/virtlockd /var/service/
	sudo ln -s /etc/sv/socklog-unix /var/service/
	#sudo ln -s /etc/sv/nanoklogd /var/service/
	#sudo ln -s /etc/sv/dnscrypt-proxy /var/service/

	sudo resolvconf -u

	#sudo ufw default deny
	#sudo ufw allow from 192.168.0.0/24
	#sudo ufw logging off
	#sudo ufw enable

	sudo mkdir /etc/sysctl.d/
	echo 'vm.swappiness=10' | sudo tee /etc/sysctl.d/99-swappiness.conf

	sudo ln -s /usr/share/fontconfig/conf.avail/10-hinting-slight.conf /etc/fonts/conf.d/
	sudo ln -s /usr/share/fontconfig/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d/
	sudo ln -s /usr/share/fontconfig/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d/
	sudo ln -s /usr/share/fontconfig/conf.avail/50-user.conf /etc/fonts/conf.d/
	sudo ln -s /usr/share/fontconfig/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d/

	#sudo chsh -s /usr/bin/fish $USER

echo "Adding user to some groups..."
sleep 3s
	sudo usermod -aG input $USER
	sudo usermod -aG audio $USER
	sudo usermod -aG video $USER
	#sudo usermod -aG libvirt $USER
	#sudo usermod -aG kvm $USER
	sudo usermod -aG socklog $USER

clear
read -p "Done"
