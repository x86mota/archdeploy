#!/bin/bash

Modules=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)
for Module in "${Modules[@]}"; do
    if ! grep -wq "^MODULES=.*${Module}" /etc/mkinitcpio.conf; then
        sudo sed -i "s/^MODULES=(\(.*\))/MODULES=(\1${Module} )/" /etc/mkinitcpio.conf
    fi
done

sudo bash -c "echo 'options nvidia_drm modeset=1 fbdev=1' >> /etc/modprobe.d/nvidia.conf"

sudo mkinitcpio -P &>/dev/null

# Enable nvidia source
sed -i "s|^#\(.*source = ./src/nvidia.conf.*\)|\1|" "${HOME}/.config/hypr/hyprland.conf"