#!/bin/bash

# Backup GRUB config file
GrubConfigFile="/etc/default/grub"
[[ ! -f "${GrubConfigFile}~" ]] && {
    sudo mv "${GrubConfigFile}" "${GrubConfigFile}~"
}

# Set new GRUB configuration
sudo bash -c "echo '# GRUB boot loader configuration
    GRUB_DEFAULT=0
    GRUB_TIMEOUT_STYLE=hidden
    GRUB_TIMEOUT=0
    GRUB_DISTRIBUTOR=\`( . /etc/os-release; echo \${NAME} ) 2>/dev/null || echo Arch Linux\`
    GRUB_CMDLINE_LINUX_DEFAULT=\"quiet splash\"
    GRUB_CMDLINE_LINUX=\"\"
    #GRUB_DISABLE_OS_PROBER=false
    ' | sed 's/^[ \t]*//' > "${GrubConfigFile}

# Additional configuration for Nvidia users 
if [[ ${GraphicsCard} = "Nvidia" ]]; then
    NvidiaModule="nvidia_drm.modeset=1"
    ! grep -q "${NvidiaModule}" "${GrubConfigFile}" && {
        sudo sed -i "s/\(GRUB_CMDLINE_LINUX_DEFAULT=\"[^\"]*\)/\1 ${NvidiaModule}/" "${GrubConfigFile}"
    }
fi

_UpdateGrub