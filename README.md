
# Themes 

    Everblush | Everforest | Gruvbox | Dracula | Nord 




&nbsp;



# Brainless Installation Process For Vanilla Arch

## Packages to Install :
```
sudo pacman -S --needed hyprland waybar rofi-wayland libnotify dunst swww imagemagick xdg-desktop-portal-hyprland hyprshot hyprlock hypridle cliphist nwg-look qt5-wayland qt6-wayland qt5ct qt6ct kvantum kvantum-qt5 network-manager-applet bluez bluez-utils blueman udiskie pacman-contrib jq brightnessctl pipewire-audio pipewire-alsa pipewire-jack pipewire-pulse gst-plugin-pipewire wireplumber pavucontrol pamixer mpv playerctl kitty btop glances cava pcmanfm-qt lxqt-policykit gvfs tar zstd git neovim zathura zathura-pdf-mupdf ly ranger amberol fastfetch
```
```
yay -S --needed qt5-styleplugins hyprshade wlogout visual-studio-code-bin qimgv-git oh-my-zsh-git zsh-syntax-highlighting-git zsh-autosuggestions-git
```
> [!important]
> To Install From `yay`, You First Need To [Install yay](https://github.com/Jguer/yay?tab=readme-ov-file#source).

## Fonts to Install :

    sudo pacman -S --needed ttf-jetbrains-mono ttf-hack-nerd ttf-jetbrains-mono-nerd ttf-nerd-fonts-symbols-common ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-mono ttf-font-awesome


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
> If you want to add/remove themes, then you need to make changes to the script file `switch1 to switch7` located in `~/.config/hypr/scripts/`
> * Hyprland, GTK & QT Theme Implentation in `switch1 & 2` 
> * Visual-studio-code Themes are in `switch4.sh` & Neovim Themes are in `switch7.sh` script file
 
## Visual studio code :
- [ ] Dracula Clean
- [ ] Gruvbox dark medium
- [ ] Nord
- [ ] Everforest Dark
- [ ] Everblush

## Neovim :
Install neovim distributions [NvChad](https://nvchad.com/docs/quickstart/install) 
```
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
```
- Run `:MasonInstallAll` command after lazy.nvim finishes downloading plugins.
- Delete the `.git` folder from nvim folder
- To update run `Lazy sync` command

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
