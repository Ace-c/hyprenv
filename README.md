
# Themes :

    Everblush | Everforest | Gruvbox | Dracula | Nord 


## Everblush :
| ![Image 1](https://github.com/user-attachments/assets/a7dc23e9-0822-4f89-90e7-7ff89b3ccf39) | ![Image 2](https://github.com/user-attachments/assets/9fa67aba-c5be-46b7-94da-d241ddd261aa) |
|---|---|


## Everforest :
| ![Image 1](https://github.com/user-attachments/assets/39cb7078-40be-43b1-b2df-ded0f0274e71) | ![Image 2](https://github.com/user-attachments/assets/e0a8e05b-2bcf-479e-a0e8-5df6e60dd9e8) |
|---|---|


## Gruv
| ![Image 1](https://github.com/user-attachments/assets/e2c2c4e0-e7e4-4185-a5e7-b5762a1d56fe) | ![Image 2](https://github.com/user-attachments/assets/30fa3c33-3587-4cf1-b870-914550cc2877) |
|---|---|


## Dracula
| ![Image 1](https://github.com/user-attachments/assets/7fb2f079-492f-4c61-a927-3bf2498ca119) | ![Image 2](https://github.com/user-attachments/assets/c418ee5a-b366-4b3f-b563-149421429fb6) |
|---|---|


## Nord
| ![Image 1](https://github.com/user-attachments/assets/6580fc9c-0d58-41b6-8d78-8c25e24cd674) | ![Image 2](https://github.com/user-attachments/assets/064ac630-5edd-462b-86a1-e942ec4b57b9) |
|---|---|



&nbsp;



# Brainless Installation Process For Vanilla Arch

## Packages to Install :
```
sudo pacman -S --needed hyprland waybar rofi-wayland libnotify dunst swww xdg-desktop-portal-hyprland hyprshot hyprlock cliphist nwg-look qt5-wayland qt6-wayland qt5ct qt6ct kvantum kvantum-qt5 network-manager-applet udiskie pacman-contrib jq pipewire-audio pipewire-alsa pipewire-jack pipewire-pulse gst-plugin-pipewire wireplumber pavucontrol pamixer mpv playerctl kitty btop glances cava pcmanfm-qt lxqt-policykit gvfs ark git neovim firefox okular
```
```
yay -S --needed qt5-styleplugins hyprshade wlogout visual-studio-code-bin qimgv oh-my-zsh-git zsh-syntax-highlighting-git zsh-autosuggestions-git ttf-material-design-icons-git
```
> [!important]
> To Install From `yay`, You first need to [Install yay](https://github.com/Jguer/yay?tab=readme-ov-file#source).

## Fonts to Install :

    sudo pacman -S --needed ttf-jetbrains-mono ttf-jetbrains-mono-nerd ttf-nerd-fonts-symbols-common ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-mono ttf-font-awesome


## Clone repository and run the script :

```
git clone https://github.com/Ace-c/hyprenv.git && cd hyprenv
```
```
chmod +x install.sh && ./install.sh
```
> [!CAUTION]
> Backup is advised if you're not installing it on fresh vanilla arch. At least backup your config files.


&nbsp;

# Required Themes for Applications 

## Visual studio code :
- [ ] Dracula Clean
- [ ] Gruvbox dark medium
- [ ] Nord
- [ ] Everforest Dark
- [ ] Everblush

## Neovim :
- [ ] Install [NvChad](https://nvchad.com/docs/quickstart/install)

## Firefox:
- [ ] [Firefox-Theme](https://github.com/EliverLara/firefox-nordic-theme)
- [ ] Firefox [New-Tab Extenstion](https://addons.mozilla.org/en-US/firefox/addon/nighttab/)

&nbsp;

# SDDM & GRUB Theming :
## SDDM Theme 

| ![Image 1](https://github.com/user-attachments/assets/63055107-c1e1-481b-9f55-58bb22a1db38) | ![Image 2](https://github.com/user-attachments/assets/cf0c8fe1-8698-40f9-a808-161ae67ad245) | ![Image 4](https://github.com/user-attachments/assets/f76e9d58-b2b8-4f10-9892-9ef8fe3f0a02) |
|---|---|---|

<pre>
1. If SDDM is not installed in your arch, Install & enable it. If Installed skip this part -
    
sudo pacman -S sddm
sudo systemctl enable sddm
    
2. To install this theme <a href="https://github.com/Ace-c/sddm-hyprenv-theme.git">Click Here</a>.
</pre>

## GRUB Theme 

<table width="100%">
  <tr>
    <td width="40%">
      <img src="https://github.com/user-attachments/assets/115946bd-191d-413e-b234-45ca950d1226" alt="Image" width="100%"/>
    </td>
    <td width="60%">
      <p>To Install this grub theme <a href="https://github.com/Ace-c/grub-vimix-theme.git">Click Here</a> </p>
    </td>
  </tr>
</table>


&nbsp;
# Some Keybindings :

## Switch themes 
     
|  Theme Name    |Keybinds                                              |
|----------------|------------------------------------------------------|
|Everblush       | <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>b</kbd>   |     
|Everforest      | <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>e</kbd>   |                     
|Dracula         | <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>d</kbd>   |
|Gruv            | <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>g</kbd>   |
|Nord            | <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>n</kbd>   |


## Switch Workspace 
<kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>←</kbd><kbd>→</kbd>

## Switch Waybar Style 

<kbd>Super</kbd> + <kbd>Alt</kbd> + <kbd>↑</kbd><kbd>↓</kbd>

## Hide|Unhide Waybar 

<kbd>Ctrl</kbd> + <kbd>Esc</kbd>

&nbsp;
