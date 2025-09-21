
# Themes 

    Everblush | Everforest | Gruvbox | Dracula | Nord 


<img width="1920" height="1080" alt="2025-07-23-164034_hyprshot" src="https://github.com/user-attachments/assets/4665c76d-a436-428b-94b4-c8e912ac1ac0" />


&nbsp;



## 1. Manual Installation (Those who know what to do) :
### Packages to Install :
```
sudo pacman -S --needed hyprland waybar rofi-wayland libnotify dunst swww imagemagick xdg-desktop-portal-hyprland hyprshot hyprlock hypridle hyprsunset cliphist rofi-emoji nwg-look qt5-wayland qt6-wayland qt5ct qt6ct kvantum kvantum-qt5 network-manager-applet bluez bluez-utils blueman udiskie pacman-contrib jq pipewire-audio pipewire-alsa pipewire-jack pipewire-pulse gst-plugin-pipewire wireplumber pavucontrol pamixer mpv playerctl kitty btop glances pcmanfm-qt lxqt-policykit gvfs tar zstd git neovim zathura zathura-pdf-mupdf ly ranger amberol fastfetch
```
```
yay -S --needed qt5-styleplugins wlogout visual-studio-code-bin qimgv-git oh-my-zsh-git zsh-syntax-highlighting-git zsh-autosuggestions-git
```

### Fonts to Install :

    sudo pacman -S --needed ttf-jetbrains-mono ttf-hack-nerd ttf-jetbrains-mono-nerd ttf-nerd-fonts-symbols-common ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-mono ttf-font-awesome noto-fonts-emoji


## 2. Automatic Installation (Brainless Process) :

> [!important]
> You First Need To Install git `sudo pacman -S git`, then follow next step

```
git clone https://github.com/Ace-c/hyprenv.git && cd hyprenv
```
```
chmod +x install.sh && ./install.sh
```
> [!CAUTION]
> Backup is advised if you're not installing it on fresh vanilla arch. At least backup your config files.


&nbsp;

## Manually install these themes for applications 

> [!TIP]
> If you want to add/remove themes, then you need to make changes in the script file `switch1 to switch5` located in **~/.config/hypr/scripts/**.

### Neovim :
Install neovim distribution [NvChad](https://nvchad.com/docs/quickstart/install) 
```
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
```
> * Run `:MasonInstallAll` command after lazy.nvim finishes downloading plugins.
> * Delete the `.git` folder from nvim folder
> * To update run `Lazy sync` command

### Visual studio code (Install all listed themes):
- [ ] Dracula Clean
- [ ] Gruvbox dark medium
- [ ] OneNord
- [ ] Everforest Dark
- [ ] Github Dark


&nbsp;


## Some Keybindings 

**1. Switch themes :**
     
|  Theme Name    |Keybinds                                              |
|----------------|------------------------------------------------------|
|Everblush       | <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>b</kbd>   |     
|Everforest      | <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>e</kbd>   |                     
|Dracula         | <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>d</kbd>   |
|Gruv            | <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>g</kbd>   |
|Nord            | <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>n</kbd>   |


**2. Switch Workspace :**    <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>←</kbd><kbd>→</kbd>


**3. Switch Waybar Style :**   <kbd>Super</kbd> + <kbd>Alt</kbd> + <kbd>↑</kbd><kbd>↓</kbd>


**4. Hide|Unhide Waybar :**    <kbd>Ctrl</kbd> + <kbd>Esc</kbd>

**5. Launch Terminal :**   <kbd>Super</kbd> + <kbd>return</kbd>

&nbsp;
