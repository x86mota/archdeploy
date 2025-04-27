#!/bin/bash

# Get CPU Vendor
cpu=$(grep -m 1 'vendor_id' /proc/cpuinfo | awk '{print $NF}')
case ${cpu} in
  AuthenticAMD) SYSTEM+=("amd-ucode") ;;
  GenuineIntel) SYSTEM+=("intel-ucode") ;;
  *) exit 0 ;;
esac

SYSTEM+=(
    hyprland
    hyprlock
    xdg-desktop-portal-hyprland
    xdg-user-dirs
    pipewire
    pipewire-pulse
    pipewire-alsa
    pipewire-jack
    gst-plugin-pipewire
    lib32-pipewire-jack
    lib32-pipewire
    wireplumber
    pavucontrol
    waybar
    wofi
    swaync
    swww
    ly
    kitty
    bash-completion
    fastfetch
    ntfs-3g
    less
    dosfstools
    network-manager-applet
    bluez
    bluez-tools
    bluez-utils
    blueman
    feh
    mpv
    mousepad
    grim
    slurp
    btop
    polkit-gnome
    thunar
    thunar-archive-plugin
    thunar-media-tags-plugin
    thunar-volman
    tumbler
    xarchiver
    unzip
    p7zip
    gvfs
    ffmpegthumbnailer
    ttf-jetbrains-mono-nerd
    noto-fonts-emoji
    ttf-dejavu
    ttf-droid
    noto-fonts
    noto-fonts-cjk
    ttf-font-awesome
    nwg-look
    gtk-engine-murrine
    sassc
    visual-studio-code-bin
    brave-bin
    bibata-cursor-theme
    discord
    steam
    lutris
    wine
    winetricks
    wine-gecko
    wine-mono
    mangohud
    goverlay
)

Amd=(
    libva-mesa-driver
    mesa
    mesa-vdpau
    vulkan-icd-loader
    vulkan-radeon
    lib32-libva-mesa-driver
    lib32-mesa
    lib32-mesa-vdpau
    lib32-vulkan-icd-loader
    lib32-vulkan-radeon
    xf86-video-amdgpu
)

Intel=(
    mesa
    vulkan-intel
    lib32-mesa
    lib32-vulkan-intel
    xf86-video-intel
)

Nvidia=(
    libva
    libva-nvidia-driver
    mesa
    nvidia-dkms
    nvidia-settings
    nvidia-utils
    vulkan-headers
    vulkan-icd-loader
    vulkan-tools
    lib32-nvidia-utils
    lib32-vulkan-icd-loader
)