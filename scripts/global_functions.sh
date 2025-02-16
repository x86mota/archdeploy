#!/bin/bash

# Checks if package is already installed
function _IsInstalled {
    local Pkg="$1"
    if command -v "${Pkg}" &>/dev/null || pacman -Q "${Pkg}" &>/dev/null; then
        return 0
    else
        return 1
    fi
}

# Checks if package is available in Arch repositories
function _IsPacmanAvailable {
    local Pkg="$1"
    if pacman -Si "${Pkg}" &>/dev/null; then
        return 0
    else
        return 1
    fi
}

# Checks if package is available in AUR
function _IsAURAvailable {
    local Pkg="$1"
    if ${AurHelper} -Si "${Pkg}" &>/dev/null; then
        return 0
    else
        return 1
    fi
}

# Install Package
function _InstallPackage {
    local Pkg="$1"
    local Args="-S --noconfirm --needed"
    local Msg="Installing ${Pkg}..."
    local AURMsg="Installing ${Pkg} from AUR. This may take a while..."
    
    if _IsPacmanAvailable "${Pkg}"; then
        echo -e "${Note} - ${Msg}"
        sudo pacman "${Args}" "${Pkg}" &>/dev/null && {
            echo -e "${Clear}${OK} - ${Msg}"
            return 0
        } || echo -e "${Clear}${Error} - ${Msg}" && exit 1
    fi

    if _IsAURAvailable "${Pkg}"; then
        echo -e "${Note} - ${AURMsg}"
        ${AurHelper} "${Args}" "${Pkg}" &>/dev/null && {
            echo -e "${OK} - ${AURMsg}"
            return 0
        } || echo -e "${Clear}${Error} - ${AURMsg}" && exit 1
    fi

    echo -e "${Clear}${Error} - Unknown package ${Pkg}." && exit 1
}
