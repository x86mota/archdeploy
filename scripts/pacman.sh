#!/bin/bash

PacmanPath="/etc/pacman.conf"
echo -e "${Note} - Adding extra spice to $(basename ${PacmanPath})"

# Enable some options
MiscOptions=(Color CheckSpace VerbosePkgLists ParallelDownloads)
for Misc in "${MiscOptions[@]}"; do
  grep -wq "^#${Misc}" "${PacmanPath}" && {
    echo -e "${Note} - Enable ${Misc}"
    sudo sed -i "s/^#${Misc}/${Misc}/" "${PacmanPath}" &>/dev/null && {
      echo -e "${Clear}${OK} - Enable ${Misc}"
    } || echo -e "${Clear}${Error} - Enable ${Misc}"
  }
done

# Add ILoveCandy option. This parameter is cool and useless at the same time
! grep -wq '^ILoveCandy' "${PacmanPath}" && {
  echo -e "${Note} - Enable ILoveCandy"
  sudo sed -i "/Color/a ILoveCandy" "${PacmanPath}" && {
    echo -e "${Clear}${OK} - Enable ILoveCandy"
  } || echo -e "${Clear}${Error} - Enable ILoveCandy"
}

# Enable multilib repository
grep -q '^#\[multilib\]' "${PacmanPath}" && {
  echo -e "${Note} - Enable multilib repository"
  sudo sed -i '/^#\[multilib\]/{s/^#//;n;s/^#//;}' "${PacmanPath}" && {
    echo -e "${Clear}${OK} - Enable multilib repository"
  } || echo -e "${Clear}${Error} - Enable multilib repository"
}

# Update system 
echo -e "${Note} - Updating system"
sudo pacman -Syu --noconfirm --needed &>/dev/null && {
  echo -e "${Clear}${OK} - System updated"
} || { 
  echo -e "${Clear}${Error} - System update failed." && exit 1
}