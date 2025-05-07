#!/bin/bash

source ./global_functions.sh
source ./packages.sh
source ./pacman.sh
source ./aurhelper.sh

# Get kernel headers
if [[ -d "usr/lib/modules" ]]; then
    for kernel in $(cat /usr/lib/modules/*/pkgbase); do
        SYSTEM+=("${kernel}-headers")
    done
else
    kernel=$(uname -s | tr '[:upper:]' '[:lower:]')
    SYSTEM+=("${kernel}-headers")
fi

# Prompt user to select a graphics card vendor
GraphicsVendors=("Amd" "Intel" "Nvidia")
_AskCustomOption "Which Graphics Card?" "${GraphicsVendors[*]}" GraphicsCard
printf "${Clear}%.0s" {1..5}

# If a graphics card vendor is selected, add to SYSTEM array
[[ ${GraphicsCard} ]] && {
    echo -e "${Note} - ${GraphicsCard} Selected"
    eval "SYSTEM+=(\"\${$GraphicsCard[@]}\")"
} || echo -e "${Note} - Skiping graphics card instalation"

# Checks if grub is installed and replaces the default configuration file
_IsInstalled grub && [ -f "/boot/grub/grub.cfg" ] && {
    source ./grub.sh
}

# Install System Packages
for Pkg in "${SYSTEM[@]}"; do
    _InstallPackage "${Pkg}"
done

# Copy configuration files
Dotfiles="https://github.com/x86mota/hyprdots.git"
TargetDir=$(basename ${Dotfiles} | sed 's/\.git$//')

_CloneRepo "${Dotfiles}" "${DownloadDir}/${TargetDir}" && {
    Dirs=(".config" ".local" ".fonts")
    for Dir in ${Dirs[@]}; do
        cp -r "${DownloadDir}/${TargetDir}/${Dir}" "${HOME}/"
    done
}

# For NVIDIA users
[[ ${GraphicsCard} = "Nvidia" ]] && {
    source ./nvidia.sh
}

# Loop through each script file in ScriptsDir and make them executable
ScriptsDir="${HOME}/.local/bin"
[[ -d "${ScriptsDir}"  ]] && {
    for sh in "${ScriptsDir}"/*; do
        if [ -f "${sh}" ]; then
            chmod u+x "${sh}"
        fi
    done
}

# Apply theme settings
source ./theme.sh

# Remove unused packages
sudo pacman -Rdd --noconfirm adwaita-cursors 2>/dev/null

# Enable Services
sudo systemctl enable ly.service 2>/dev/null

#  Setup completed message
echo -e "${OK} - Installation Completed\n"
echo -en "${Action} - Would you like to reboot now? (y/n): "
read -r
if [[ "$REPLY" =~ [Yy]$ ]]; then
    systemctl reboot
fi