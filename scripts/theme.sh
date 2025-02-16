#!/bin/bash

# Download theme
ThemeURL=https://github.com/vinceliuice/Matcha-gtk-theme.git
ThemeName=$(basename ${ThemeURL} | sed 's/\.git$//')

_CloneRepo "${ThemeURL}" "${DownloadDir}/${ThemeName}"

bash "${DownloadDir}/${ThemeName}/install.sh" --libadwaita --theme sea --color dark &>/dev/null

# Initiate GTK dark mode and apply icon, cursor theme and fonts
ColorScheme="prefer-dark"
GtkTheme="Matcha-dark-sea"
IconTheme="Papirus-Dark"
CursorTheme="Adwaita"
CursorSize="24"
FontName="JetBrainsMono Nerd Font 11"

gsettings set org.gnome.desktop.interface color-scheme "${ColorScheme}"
gsettings set org.gnome.desktop.interface gtk-theme "${GtkTheme}"
gsettings set org.gnome.desktop.interface icon-theme "${IconTheme}"
gsettings set org.gnome.desktop.interface cursor-theme "${CursorTheme}"
gsettings set org.gnome.desktop.interface cursor-size "${CursorSize}"
gsettings set org.gnome.desktop.interface font-name "${FontName}"