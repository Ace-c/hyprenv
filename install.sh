#!/bin/bash
set -e

# Installing from official repo
echo "Installing Packages from official repo..."
sudo pacman -Syu --needed --noconfirm \
  hyprland waybar rofi-wayland libnotify dunst swww imagemagick \
  xdg-desktop-portal-hyprland hyprshot hyprlock hypridle hyprsunset \
  cliphist rofi-emoji nwg-look qt5-wayland qt6-wayland qt5ct qt6ct \
  kvantum kvantum-qt5 network-manager-applet bluez bluez-utils blueman \
  udiskie pacman-contrib jq pipewire-audio pipewire-alsa pipewire-jack \
  pipewire-pulse gst-plugin-pipewire wireplumber pavucontrol pamixer \
  mpv playerctl kitty btop glances pcmanfm-qt lxqt-policykit gvfs tar \
  zstd git neovim zathura zathura-pdf-mupdf ly yazi amberol fastfetch

# Install yay & AUR packages
if ! command -v yay &>/dev/null; then
    echo "Installing yay (AUR helper)..."
    tmpdir=$(mktemp -d)
    git clone https://aur.archlinux.org/yay.git "$tmpdir"
    cd "$tmpdir"
    makepkg -si --noconfirm
    cd -
    rm -rf "$tmpdir"
else
    echo "yay already installed."
fi

echo "Installing AUR packages..."
yay -S --needed --noconfirm \
  qt5-styleplugins wlogout visual-studio-code-bin qimgv-git \
  oh-my-zsh-git zsh-syntax-highlighting-git zsh-autosuggestions-git

# Copy config files 
echo "copyig files..."

if [ -d ~/.config ]; then
    cp -r .config/* ~/.config/
else
    cp -r .config ~/
fi

tar -xf .icons/Icons.tar.zst -C .icons/
rm .icons/Icons.tar.zst

if [ -d ~/.icons ]; then
    cp -r .icons/* ~/.icons/
else
    cp -r .icons ~/
fi

tar -xf .themes/Themes.tar.zst -C .themes/
rm .themes/Themes.tar.zst

if [ -d ~/.themes ]; then
    cp -r .themes/* ~/.themes/
else
    cp -r .themes ~/
fi

if [ -d ~/.local/share/fonts ]; then
    cp -r fonts/* ~/.local/share/fonts/
else
    cp -r fonts ~/.local/share/
fi
# Update font cache
fc-cache -fv

cp .gtkrc-2.0 ~/


# If user want to switch from bash to zsh
read -p "Do you want to switch from Bash to Zsh and install Zsh config? [y/N]: " switch_to_zsh
switch_to_zsh=${switch_to_zsh,,}  # convert to lowercase

if [[ "$switch_to_zsh" != "y" ]]; then
    echo "Skipping Zsh setup."
    exit 0
fi

# check for yay
if ! command -v yay &>/dev/null; then
    echo "'yay' is not installed. You need it to install AUR packages."
    echo "Please install yay manually: https://aur.archlinux.org/packages/yay"
    exit 1
fi

# check & install oh-my-zsh-git and plugins
if ! yay -Q oh-my-zsh-git &>/dev/null; then
    read -p "'oh-my-zsh-git' is not installed. Install now from AUR? [y/N]: " install_omz
    install_omz=${install_omz,,}
    if [[ "$install_omz" == "y" ]]; then
        yay -S oh-my-zsh-git --noconfirm
    else
        echo "Skipping oh-my-zsh setup."
        exit 1
    fi
fi

if ! yay -Q zsh-autosuggestions &>/dev/null; then
    read -p "'zsh-autosuggestions' is not installed. Install now? [y/N]: " install_autosuggest
    install_autosuggest=${install_autosuggest,,}
    if [[ "$install_autosuggest" == "y" ]]; then
        yay -S zsh-autosuggestions --noconfirm
    fi
fi

if ! yay -Q zsh-syntax-highlighting-git &>/dev/null; then
    read -p "'zsh-syntax-highlighting-git' is not installed. Install now? [y/N]: " install_syntax
    install_syntax=${install_syntax,,}
    if [[ "$install_syntax" == "y" ]]; then
        yay -S zsh-syntax-highlighting-git --noconfirm
    fi
fi

# Symlink plugins
custom_plugins="/usr/share/oh-my-zsh/custom/plugins"
[[ -d "$custom_plugins" ]] || sudo mkdir -p "$custom_plugins"

if [ -d /usr/share/zsh/plugins/zsh-autosuggestions ]; then
    sudo ln -sf /usr/share/zsh/plugins/zsh-autosuggestions "$custom_plugins/"
fi

if [ -d /usr/share/zsh/plugins/zsh-syntax-highlighting ]; then
    sudo ln -sf /usr/share/zsh/plugins/zsh-syntax-highlighting "$custom_plugins/"
fi

# Backup & copy .zshrc
if [ -f ~/.zshrc ]; then
    echo "Backing up existing .zshrc to ~/.zshrc.bak"
    mv ~/.zshrc ~/.zshrc.bak
fi

cp .zshrc ~/
echo "Copied new .zshrc"

# Change shell to zsh
if [[ $SHELL != *zsh ]]; then
    echo "Changing default shell to Zsh..."
    chsh -s "$(command -v zsh)"
    echo "Shell changed to Zsh."
else
    echo "Shell is already Zsh."
fi

# Select theme
echo
echo "Choose a theme to apply:"
echo "  [e] Everforest"
echo "  [b] Everblush"
echo "  [d] Dracula"
echo "  [g] Gruvbox"
echo "  [n] Nord"
read -rp "Enter your choice [e/b/d/g/n]: " theme_choice

case "$theme_choice" in
    e|E)
        echo "Switching to Everforest..."
        ~/.config/hypr/scripts/switchmaster.sh -e
        ;;
    b|B)
        echo "Switching to Everblush..."
        ~/.config/hypr/scripts/switchmaster.sh -b
        ;;
    d|D)
        echo "Switching to Dracula..."
        ~/.config/hypr/scripts/switchmaster.sh -d
        ;;
    g|G)
        echo "Switching to Gruvbox..."
        ~/.config/hypr/scripts/switchmaster.sh -g
        ;;
    n|N)
        echo "Switching to Nord..."
        ~/.config/hypr/scripts/switchmaster.sh -n
        ;;
    *)
        echo "Invalid choice. Skipping theme switch."
        ;;
esac
