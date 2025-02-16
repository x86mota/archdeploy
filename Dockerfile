FROM archlinux

RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm --needed git sudo && \
    useradd -mG wheel test -s /usr/bin/bash && \
    sed -i '/^# %wheel ALL=(ALL:ALL) NOPASSWD: ALL/s/^# //' /etc/sudoers && \
    echo -e "\n#[multilib]\n#Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf

USER test
WORKDIR /home/test

LABEL description="This is an image to test the installation script."