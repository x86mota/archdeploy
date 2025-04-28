#!/bin/bash

# Check for installed AUR helper
AurHelpers=("yay" "paru")
for Helper in "${AurHelpers[@]}"; do
    if _IsInstalled "$Helper" &>/dev/null; then
        AurHelper="$Helper"
        echo -e "${Note} - AUR helper ${AurHelper} found" 
        break
    fi
done

# If no AUR helper is found, prompt user to select one
if [[ -z "$AurHelper" ]]; then
    _AskCustomOption "Which AUR helper?" "${AurHelpers[*]}" AurHelper

    printf "${Clear}%.0s" {1..4}

    # If a helper is selected, install it
    [[ "$AurHelper" ]] && {
        echo -e "${Note} - ${AurHelper} selected."

        # Install base-devel
        _InstallPackage base-devel

        # Clone the AUR repository for the selected helper
        _CloneRepo "https://aur.archlinux.org/${AurHelper}.git" "${DownloadDir}/${AurHelper}"

        # Install the AUR helper using makepkg
        echo -e "${Note} - Installing ${AurHelper}..."
        makepkg --noconfirm -si --dir "${DownloadDir}/${AurHelper}" &>/dev/null && {
            printf "${Clear}%.0s" {1..2}
            echo -e "${OK} - ${AurHelper} installed."
        } || echo -e "${Clear}${Error} - ${AurHelper} installation failed."
        
    } || echo -e "${Note} - Skiping AUR Helper instalation"
fi