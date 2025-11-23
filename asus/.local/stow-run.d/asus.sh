#!/usr/bin/env bash

# Installing and configuring g14 REPO

if [ ! -f "/etc/pacman.d/mirrorlist-g14" ]; then

  sudo pacman-key --recv-keys 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35
  sudo pacman-key --finger 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35
  sudo pacman-key --lsign-key 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35
  sudo pacman-key --finger 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35

  wget "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x8b15a6b0e9a3fa35" -O g14.sec
  sudo pacman-key -a g14.sec

  cat <<EOF | sudo tee -a /etc/pacman.conf

[g14]
Include = /etc/pacman.d/mirrorlist-g14

EOF

  cat <<EOF | sudo tee /etc/pacman.d/mirrorlist-g14

## Germany
# Server = https://arch.asus-linux.org
## Korea
Server = https://naru.jhyub.dev/g14

EOF

fi

sudo pacman -Sy
sudo pacman -S --needed --noconfirm asusctl power-profiles-daemon supergfxctl switcheroo-control rog-control-center linux-g14{,-headers}
sudo systemctl enable --now power-profiles-daemon
sudo systemctl enable --now supergfxd
sudo systemctl enable --now switcheroo-control

sudo grub-mkconfig -o /boot/grub/grub.cfg
