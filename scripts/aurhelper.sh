#!/bin/bash

# Check for installed AUR helper
AurHelpers=("paru" "yay")
for Helper in "${AurHelpers[@]}"; do
    if _IsInstalled "$Helper" &>/dev/null; then
        AurHelper="$Helper"
        echo -e "${Note} - AUR helper ${AurHelper} found" 
        break
    fi
done