#!/bin/bash

function _InstallTheme {
    local url=$1
    local args=$2
    local name=$(basename ${url} | sed 's/\.git$//')
    _CloneRepo "${url}" "${DownloadDir}/${name}"

    bash "${DownloadDir}/${name}/install.sh" ${args} &>/dev/null
}

# Install GTK theme
_InstallTheme "https://github.com/vinceliuice/Matcha-gtk-theme.git" "--libadwaita"

# Install icon theme
_InstallTheme "https://github.com/vinceliuice/WhiteSur-icon-theme.git" "-d ${HOME}/.icons -t all -a -b"

# Initiate GTK dark mode and apply icon, cursor theme and fonts
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
gsettings set org.gnome.desktop.interface gtk-theme "Matcha-dark-sea"
gsettings set org.gnome.desktop.interface icon-theme "WhiteSur-nord-dark"
gsettings set org.gnome.desktop.interface cursor-theme "Bibata-Modern-Ice"
gsettings set org.gnome.desktop.interface cursor-size "24"
gsettings set org.gnome.desktop.interface font-name "JetBrainsMono Nerd Font 11"