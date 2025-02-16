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
