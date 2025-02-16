#!/bin/bash

# Backup GRUB config file
GrubConfigFile="/etc/default/grub"
[[ ! -f "${GrubConfigFile}~" ]] && {
    sudo mv "${GrubConfigFile}" "${GrubConfigFile}~"
}