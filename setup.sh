#!/bin/sh

# cd ~
# git clone https://github.com/unites/.config.git

# Add RPM Fusion
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Ensure Google Chrome repo is in place
sudo dnf install fedora-workstation-repositories -y 
sudo dnf config-manager --set-enabled google-chrome -y
# Sublime Text Repo Addition
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg 
sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo -y
# Add Docker
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo
#Brave Browser
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/ -y
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

# Edge
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/edge
sudo mv /etc/yum.repos.d/packages.microsoft.com_yumrepos_edge.repo /etc/yum.repos.d/microsoft-edge-dev.repo

# Update Dnf
sudo dnf -y update

# Install Base sway, some cross over with i3
sudo dnf -y install sway \
swaylock \
swayidle \
waybar \
wl-clipboard \
fira-code-fonts \
fontawesome-fonts \
powerline-fonts \
feh \
grim \
slurp \
wofi \
fzf \
zsh \
git \
curl \
wget \
tar \
bind-utils \
rsync \
cifs-utils \
light \
mako \
ranger \
sublime-text \
vim \
firefox-wayland \
google-chrome-stable \
chromium \
libgnome-keyring \
nautilus \
seahorse \
gnome-keyring \
libsecret \
python3 \
python3-pip \
ruby \
nodejs \
pulseaudio \
pavucontrol \
mpc \
mpd \
ncmpcpp \
mpv \
vlc \
wildmidi \
pulseaudio-utils \
bdf2psf \
otf2bdf \
wf-recorder \
ffmpeg \
NetworkManager-bluetooth \
NetworkManager-wifi \
NetworkManager-tui \
fuse-sshfs \
freerdp \
nm-connection-editor \
brave-browser \
microsoft-edge-dev \
microsoft-edge-beta \
syncthing \
gnome-bluetooth \
gnome-logs \
python3-gobject \
blueman \
ksystemlog \
ghostwriter \
gimp \
rsyslog \
id3v2 \
pciutils \
google-noto-emoji-color-fonts \
google-noto-emoji-fonts \
gnome-system-monitor \
ksystemlog \
clipman \
vinagre \
remotely

# Python modules, General
pip3 install requests
pip3 instal youtube-dl

# Desktop Heavy (optional)
sudo dnf -y install docker-ce \
docker-ce-cli \
containerd.io \
obs-studio 

# sudo systemctl enable wpa_supplicant.service
# sudo systemctl start wpa_supplicant.service

echo "export EDITOR='vim'" >> ~/.bashrc

# I3 primarily
sudo dnf -y install xorg-x11-xinit \
i3 \
i3status \
dmenu \
i3lock \
conky \
xorg-x11-drv-libinput \
gnome-connections \
xorg-x11-xinit \
ckb-next \
kbd \
xrandr \
rofi \
xss-lock \
ImageMagick \
xautolock \
xset \
polybar \
compton \
nitrogen \
flameshot \
maim \
xclip \
dunst \
qt-qdbusviewer.x86_64 \
gnome-icon-theme \
gnome-shell-extension-caffeine \
youtube-dl 


# Nvidia
# akmod-nvidia \
# xorg-x11-drv-nouveau \

# for laptop
# xbacklight 

# Install Oh My ZSH
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
exit
sudo usermod -s $(which zsh) $USER


# Fun Plugins for OhMyZSH
cd ~
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# P10k for ohmyzsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

chmod -R 755 ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
chmod -R 755 ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Set user to docker group
sudo usermod -aG docker $USER
# MPD and Background vars need this.  Would suggest throwing a background.jpg in the Images Dir.
mkdir -p ~/Music
mkdir -p ~/Images/screenshots


cd ~
git clone --depth=1 https://github.com/ryanoasis/nerd-fonts ~/.nerd-fonts
cd .nerd-fonts 
fc-cache -fv
./install.sh Hack
./install.sh Terminus
./install.sh HeavyData
fc-cache -fv

echo << EOF
Switch Shell, because chsh is not installed. Run these:
	which zsh
	sudo lchsh -i
EOF

# Link setup scripts to home dir from config
ln -fs ~/.config/.zshrc ~/.zshrc
ln -fs ~/.config/.vimrc ~/.vimrc
ln -fs ~/.config/.xinitrc ~/.xinitrc
