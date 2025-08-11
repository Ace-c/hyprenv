
# Themes 

    Everblush | Everforest | Gruvbox | Dracula | Nord 


<img width="1920" height="1080" alt="2025-07-23-164034_hyprshot" src="https://github.com/user-attachments/assets/4665c76d-a436-428b-94b4-c8e912ac1ac0" />


&nbsp;



# Brainless Installation Process For Vanilla Arch

## Packages to Install :
```
sudo pacman -S --needed hyprland waybar rofi-wayland libnotify dunst swww imagemagick xdg-desktop-portal-hyprland hyprshot hyprlock hypridle hyprsunset cliphist rofi-emoji nwg-look qt5-wayland qt6-wayland qt5ct qt6ct kvantum kvantum-qt5 network-manager-applet bluez bluez-utils blueman udiskie pacman-contrib jq pipewire-audio pipewire-alsa pipewire-jack pipewire-pulse gst-plugin-pipewire wireplumber pavucontrol pamixer mpv playerctl kitty btop glances pcmanfm-qt lxqt-policykit gvfs tar zstd git neovim zathura zathura-pdf-mupdf ly ranger amberol fastfetch
```
```
yay -S --needed qt5-styleplugins wlogout visual-studio-code-bin qimgv-git oh-my-zsh-git zsh-syntax-highlighting-git zsh-autosuggestions-git
```
> [!important]
> To Install From `yay`, You First Need To [Install yay](https://github.com/Jguer/yay?tab=readme-ov-file#source).

## Fonts to Install :

    sudo pacman -S --needed ttf-jetbrains-mono ttf-hack-nerd ttf-jetbrains-mono-nerd ttf-nerd-fonts-symbols-common ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-mono ttf-font-awesome noto-fonts-emoji


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
> If you want to add/remove themes, then you need to make changes to the script file `switch1 to switch7` located in **~/.config/hypr/scripts/**.
 
## Visual studio code :
- [ ] Dracula Clean
- [ ] Gruvbox dark medium
- [ ] OneNord
- [ ] Everforest Dark
- [ ] Github Dark

## Neovim :
Install neovim distribution [NvChad](https://nvchad.com/docs/quickstart/install) 
```
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
```
> * Run `:MasonInstallAll` command after lazy.nvim finishes downloading plugins.
> * Delete the `.git` folder from nvim folder
> * To update run `Lazy sync` command

&nbsp;


## Grub Theme :

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
