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
    local AurHelper="$1"
    local Pkg="$2"
    if ${AurHelper} -Si "${Pkg}" &>/dev/null; then
        return 0
    else
        return 1
    fi
}