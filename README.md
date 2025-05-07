# About
This repository is dedicated to the installation of packages and customization of a clean installation of Arch Linux.. It contains a script that automates the process of installing and initial system configuration.

<br>

> [!NOTE]
> This repo does not contain Hyprland configs! During installation, it will be downloaded from another repository.
> Dotfiles can be checked [here](https://github.com/x86mota/hyprdots)

<br>

## Requirements
- A clean installation of Arch Linux
- sudo privileges
- git

<br>

## Installation
Just copy this command in your terminal and execute
```bash
bash <(curl -sL https://raw.githubusercontent.com/x86mota/archdeploy/refs/heads/main/setup.sh)
```
<br>

## Main Packages

|   Name                                                                                            | Function              |
|   :--------                                                                                       |:----------            |
|   [ly](https://archlinux.org/packages/extra/x86_64/ly/)                                           | Display/Login Manager |
|   [hyprland](https://archlinux.org/packages/extra/x86_64/hyprland/)                               | Wayland Compositor    |
|   [waybar](https://archlinux.org/packages/extra/x86_64/waybar/)                                   | Status Bar            |
|   [kitty](https://wiki.archlinux.org/title/Kitty)                                                 | Terminal Emulator     |
|   [wofi](https://archlinux.org/packages/extra/x86_64/wofi/)                                       | App Launcher          |
|   [swww](https://archlinux.org/packages/extra/x86_64/swww/)                                       | Wallpaper Backend     |
|   [fastfetch](https://archlinux.org/packages/extra/x86_64/fastfetch/)                             | Fetch Tool            |
|   [thunar](https://archlinux.org/packages/extra/x86_64/thunar/)                                   | File Explorer         |
|   [btop](https://archlinux.org/packages/extra/x86_64/btop/)                                       | System Monitor        |
|   [swaync](https://archlinux.org/packages/extra/x86_64/swaync/)                                   | Notifications         |
|   [firefox](https://archlinux.org/packages/extra/x86_64/firefox/)                                 | Web Browser           |
|   [mousepad](https://archlinux.org/packages/extra/x86_64/mousepad/)                               | Simple Text Editor    |
|   [feh](https://archlinux.org/packages/extra/x86_64/feh/)                                         | Image Viewer          |
|   [mpv](https://archlinux.org/packages/extra/x86_64/mpv/)                                         | Media Player          |
|   [Visual Studio Code](https://aur.archlinux.org/packages/visual-studio-code-bin) <sup>aur</sup>  | Code Editor           |

> [!NOTE]
> You can find all packages [here](scripts/packages.sh)
