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