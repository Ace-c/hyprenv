
# Themes 

    Everblush | Everforest | Gruvbox | Dracula | Nord 


## Everblush 
| ![Image 1](https://github.com/user-attachments/assets/a7dc23e9-0822-4f89-90e7-7ff89b3ccf39) | ![Image 2](https://github.com/user-attachments/assets/9fa67aba-c5be-46b7-94da-d241ddd261aa) |
|---|---|


## Everforest 
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
sudo pacman -S --needed hyprland waybar rofi-wayland libnotify dunst swww imagemagick xdg-desktop-portal-hyprland hyprshot hyprlock cliphist nwg-look qt5-wayland qt6-wayland qt5ct qt6ct kvantum kvantum-qt5 network-manager-applet udiskie pacman-contrib jq pipewire-audio pipewire-alsa pipewire-jack pipewire-pulse gst-plugin-pipewire wireplumber pavucontrol pamixer mpv playerctl kitty btop glances cava pcmanfm-qt lxqt-policykit gvfs ark git neovim firefox okular
```
```
yay -S --needed qt5-styleplugins hyprshade wlogout visual-studio-code-bin qimgv oh-my-zsh-git zsh-syntax-highlighting-git zsh-autosuggestions-git ttf-material-design-icons-git
```
> [!important]
> To Install From `yay`, You First Need To [Install yay](https://github.com/Jguer/yay?tab=readme-ov-file#source).

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

# Install Following Themes for Applications 

> [!TIP]
> If you want to install different themes and also sync them with the system, then you need to make changes to the script file located in `~/.config/hypr/scripts/`
> * Visual-studio-code Themes are in `switch4.sh` script file
> * Firefox & Neovim Themes are in `switch7.sh` script file
 
## Visual studio code :
- [ ] Dracula Clean
- [ ] Gruvbox dark medium
- [ ] Nord
- [ ] Everforest Dark
- [ ] Everblush

## Firefox :
-  Install This [Firefox-Theme](https://github.com/EliverLara/firefox-nordic-theme#installation-script)
-  And also this beautiful [New-Tab](https://addons.mozilla.org/en-US/firefox/addon/nighttab/) Extension.

> [!NOTE]
> To sync firefox theme with system theme, You need to change firefox theme location in script `switch7.sh`.

## Neovim :
Install [NvChad](https://nvchad.com/docs/quickstart/install) .


&nbsp;


## GRUB Theme :

<table width="100%">
  <tr>
    <td width="30%">
      <img src="https://github.com/user-attachments/assets/115946bd-191d-413e-b234-45ca950d1226" alt="Image" width="100%"/>
    </td>
    <td width="70%">
      <p>To Install this grub theme <a href="https://github.com/Ace-c/grub-vimix-theme/blob/master/README.md#manual-installation-">Follow this guide</a> </p>
    </td>
  </tr>
</table>


&nbsp;
# Some Keybindings 

## Switch themes :
     
|  Theme Name    |Keybinds                                              |
|----------------|------------------------------------------------------|
|Everblush       | <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>b</kbd>   |     
|Everforest      | <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>e</kbd>   |                     
|Dracula         | <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>d</kbd>   |
|Gruv            | <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>g</kbd>   |
|Nord            | <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>n</kbd>   |


## Switch Workspace :
<kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>←</kbd><kbd>→</kbd>

## Switch Waybar Style :

<kbd>Super</kbd> + <kbd>Alt</kbd> + <kbd>↑</kbd><kbd>↓</kbd>

## Hide|Unhide Waybar :

<kbd>Ctrl</kbd> + <kbd>Esc</kbd>

## Launch Terminal :

<kbd>Super</kbd> + <kbd>return</kbd>

&nbsp;
