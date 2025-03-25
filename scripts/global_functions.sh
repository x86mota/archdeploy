#!/bin/bash

# Checks if package is already installed
function _IsInstalled {
    local Pkg="$1"
    pacman -Q "${Pkg}" &>/dev/null
}

# Checks if package is available in Arch repositories
function _IsPacmanAvailable {
    local Pkg="$1"
    pacman -Si "${Pkg}" &>/dev/null
}

# Checks if package is available in AUR
function _IsAURAvailable {
    local Pkg="$1"
    ${AurHelper} -Si "${Pkg}" &>/dev/null
}

# Install Package
function _InstallPackage {
    local Pkg="$1"
    local Args="-S --noconfirm --needed"
    local Msg="Installing ${Pkg}..."
    local AURMsg="Installing ${Pkg} from AUR. This may take a while..."

    if _IsInstalled "${Pkg}"; then
        echo -e "${Note} - ${Pkg} already installed."
        return 0
    fi
    
    if _IsPacmanAvailable "${Pkg}"; then
        echo -e "${Note} - ${Msg}"
        if sudo pacman ${Args} "${Pkg}" &>/dev/null; then
            echo -e "${Clear}${OK} - ${Msg}"
            return 0
        else
            echo -e "${Clear}${Error} - ${Msg}"
            exit 1
        fi
    fi

    if _IsAURAvailable "${Pkg}"; then
        echo -e "${Note} - ${AURMsg}"
        if ${AurHelper} ${Args} "${Pkg}" &>/dev/null; then
            echo -e "${Clear}${OK} - ${AURMsg}"
            return 0
        else
            echo -e "${Clear}${Error} - ${AURMsg}"
            exit 1
        fi
    fi

    echo -e "${Clear}${Error} - Package ${Pkg} not found."
    exit 1
}

# Clone a remote repository
function _CloneRepo {
    local URL="$1"
    local TargetDir="$2"

    [[ -d "${TargetDir}" ]] && rm -rf "${TargetDir}"

    echo -e "${Note} - Cloning repository ${URL} ... "
    git clone "${URL}" "${TargetDir}" &>/dev/null && {
        echo -e "${Clear}${OK} - Cloning repository ${URL} ... "
        return 0
    } || echo -e "${Clear}${Error} - Repository not found: ${URL} ." && exit 1
}

# Custom Option
function _AskCustomOption {
    local Prompt=$1
    local Options=($2)

    [[ ! $3 ]] && return 1

    echo -e "${Action} - ${Prompt}"
    for Opt in ${!Options[@]}; do
        echo "$((${Opt} + 1))) ${Options[Opt]}"
    done

    read -rp "Enter your choice (default = NONE): [1-${#Options[@]}] "

    if [[ "${REPLY}" =~ ^[1-9]$ ]]; then
        [[ Options[$(($REPLY - 1))] ]] && {
            eval "$3='${Options[$(($REPLY - 1))]}'"
            return 0
        }
    fi
}

# Update GRUB
function _UpdateGrub {
    echo -e "${Note} - Updating GRUB..."
    sudo grub-mkconfig -o /boot/grub/grub.cfg 2>/dev/null && {
        echo -e "${Clear}${OK} - Updating GRUB..."
        return 0
    } || echo -e "${Clear}${Error} - Updating GRUB..."
    return 1
}