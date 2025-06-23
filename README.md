
# Themes :

    Everblush | Everforest | Gruvbox | Dracula | Nord 


## Everblush :
| ![Image 1](https://github.com/user-attachments/assets/a7dc23e9-0822-4f89-90e7-7ff89b3ccf39) | ![Image 2](https://github.com/user-attachments/assets/b6e04005-c198-4102-b6a7-938b2fb745fd) |
|---|---|
| ![Image 3](https://github.com/user-attachments/assets/1b1b16ca-fc91-464f-a8c7-a817f47311ea) | ![Image 4](https://github.com/user-attachments/assets/9fa67aba-c5be-46b7-94da-d241ddd261aa) |

## Everforest :
| ![Image 1](https://github.com/user-attachments/assets/39cb7078-40be-43b1-b2df-ded0f0274e71) | ![Image 2](https://github.com/user-attachments/assets/e0a8e05b-2bcf-479e-a0e8-5df6e60dd9e8) |
|---|---|
| ![Image 3](https://github.com/user-attachments/assets/46cc62e4-c63f-43bf-a190-e34d9c417f9a) | ![Image 4](https://github.com/user-attachments/assets/21c1e881-44ee-4d04-ba11-661bb1a72ed9) |

## Gruv
| ![Image 1](https://github.com/user-attachments/assets/e2af208f-479e-4f1d-a44c-9617bd6783d1) | ![Image 2](https://github.com/user-attachments/assets/e2c2c4e0-e7e4-4185-a5e7-b5762a1d56fe) |
|---|---|
| ![Image 3](https://github.com/user-attachments/assets/30fa3c33-3587-4cf1-b870-914550cc2877) | ![Image 4](https://github.com/user-attachments/assets/06989278-ec35-45a4-9a61-7f1f5c9b8a27) |

## Dracula
| ![Image 1](https://github.com/user-attachments/assets/7fb2f079-492f-4c61-a927-3bf2498ca119) | ![Image 2](https://github.com/user-attachments/assets/1a91f670-ca3f-4a73-8e5d-fbdd92b741af) |
|---|---|
| ![Image 3](https://github.com/user-attachments/assets/c418ee5a-b366-4b3f-b563-149421429fb6) | ![Image 4](https://github.com/user-attachments/assets/99cb47a7-4c76-4ca8-a1b3-86dbadfd817d) |

## Nord
| ![Image 1](https://github.com/user-attachments/assets/6580fc9c-0d58-41b6-8d78-8c25e24cd674) | ![Image 2](https://github.com/user-attachments/assets/064ac630-5edd-462b-86a1-e942ec4b57b9) |
|---|---|
| ![Image 3](https://github.com/user-attachments/assets/c1c94429-b722-4ca6-8963-63aaa1c78e14) | ![Image 4](https://github.com/user-attachments/assets/1b82d660-19f8-407d-9088-85604d0a4592) |


&nbsp;



# Brainless Installation Process For Fresh Installed Arch:

## Packages to Install :
### Official 
    sudo pacman -S hyprland waybar rofi-wayland libnotify dunst swww xdg-desktop-portal-hyprland hyprshot hyprlock cliphist nwg-look qt5-wayland qt6-wayland qt5ct qt6ct kvantum kvantum-qt5 sddm networkmanager network-manager-applet bluez bluez-utils blueman brightnessctl udiskie pacman-contrib parallel jq pipewire-audio pipewire-alsa pipewire-jack pipewire-pulse gst-plugin-pipewire wireplumber pavucontrol pamixer mpv mpv-mpris playerctl kitty btop glances cava pcmanfm-qt lxqt-policykit gvfs
### AUR 
    yay -S qt5-styleplugins hyprshade wlogout visual-studio-code-bin
> [!NOTE]
> To install from aur, you need yay as a helper, install it first.
## Fonts :

    sudo pacman -S ttf-jetbrains-mono ttf-jetbrains-mono-nerd ttf-nerd-fonts-symbols-common ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-mono ttf-font-awesome

```
yay -S ttf-material-design-icons-git
```
* After then, place all the fonts from this repo to .local/share/fonts dir of your system
* At last you have to update your font cache, just run
```
sudo fc-cache -fv
```
### Enable services :
```
sudo systemctl enable sddm.service
```
```
sudo systemctl enable NetworkManager
```
```
sudo systemctl enable --now bluetooth.service
```


&nbsp;


# Install following themes for applications :
 

### Neovim

Just Install [NvChad](https://nvchad.com/) theme


***

### Visual studio code

    Dracula Clean
    Gruvbox dark medium
    Nord
    Everforest Dark
    Everblush

***


### Firefox

[Firefox-Nordic-Theme](https://github.com/EliverLara/firefox-nordic-theme)

> Change the location of firefox (dark.css file) in script (Switch7)

    
Sync newtab page with system theme. Install this addon : 
[New-Tab Extenstion](https://addons.mozilla.org/en-US/firefox/addon/nighttab/)

&nbsp;

## How to change theme from terminal :

``` cd .config/hypr/scripts ```

```
./switchmaster.sh -e  [-e(everforest) -d(dracula) -g(gruv) -n(nord) -b(everblush)]
```

&nbsp;
## Switch Waybar Style :

<kbd>Super</kbd> + <kbd>Alt</kbd> + <kbd>↑</kbd><kbd>↓</kbd>

## Hide|Unhide Waybar :

<kbd>Ctrl</kbd> + <kbd>Esc</kbd>

