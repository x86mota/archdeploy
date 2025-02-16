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

