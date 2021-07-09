#!/bin/sh

# Accept User Name
uname="$1"
hdir="/home/$uname"

if [ -z $1 ]; then
    echo "User Name was not given, please give a user name or pass \$USER"
    exit
fi

# Make sure sudo or root
if [ `whoami` != root ]; then
    echo Please run this script as root or using sudo
    exit
fi

# Add RPM Fusion
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Ensure Google Chrome repo is in place
sudo dnf install fedora-workstation-repositories -y 
sudo dnf config-manager --set-enabled google-chrome -y

# Sublime Text Repo Addition
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg 
sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo -y

#Brave Browser
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/ -y
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

# Edge
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/edge
sudo mv /etc/yum.repos.d/packages.microsoft.com_yumrepos_edge.repo /etc/yum.repos.d/microsoft-edge-dev.repo

# Add Docker
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo

# Update Repo's and Install packages
sudo dnf -y update

sudo dnf -y install git \
powerline-fonts \
feh \
zsh \
curl \
feh \
zsh \
git \
curl \
wget \
tar \
unzip \
rsync \
cifs-utils \
light \
ranger \
vim \
chromium \
nautilus \
seahorse \
python3 \
ruby \
nodejs \
pulseaudio \
pavucontrol \
mpc \
mpd \
ncmpcpp \
mpv \
vlc \
ffmpeg \
freerdp \
syncthing \
gnome-bluetooth \
gnome-logs \
blueman \
ksystemlog \
gimp \
id3v2 \
gnome-system-monitor \
ksystemlog \
i3-gaps \
i3status \
dmenu \
i3lock \
conky \
gnome-connections \
kbd \
rofi \
xss-lock \
xautolock \
picom \
nitrogen \
maim \
xclip \
dunst \
gnome-icon-theme \
neofetch \
conky \
ImageMagick \
bind-utils \
util-linux-user \
xorg-x11-server-Xorg \
xorg-x11-xinit \
xinit 

# Docker
sudo dnf -y install docker-ce \
docker-ce-cli 

# Add user to docker group
sudo usermod -aG docker $uname

# Config File Pull
cd $hdir
git clone https://github.com/unites/.config.git

# Nerd Fonts
mkdir -p  $hdir/.local/share/fonts/NerdFonts
cd  $hdir/.local/share/fonts/NerdFonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Terminus.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/DejaVuSansMono.zip
unzip Terminus.zip
unzip Hack.zip
unzip DejaVuSansMono.zip
rm *.zip
rm *Windows*.ttf
fc-cache -fv  $hdir/.local/share/fonts/NerdFonts

# Install Oh My ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
sudo usermod --shell /usr/bin/zsh $uname
sudo usermod --shell /usr/bin/zsh root

# Plugins for OhMyZSH
cd $hdir
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-/root/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-/root/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# P10k for ohmyzsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /root/.oh-my-zsh/themes/powerlevel10k

cp -r /root/.oh-my-zsh $hdir

# sed -i 's/robbyrussell/avit/g' /root/.zshrc
# echo "DISABLE_AUTO_UPDATE='true'" >> /root/.zshrc

# Nvidia Driver Install, requires reboot
# sudo dnf -y install nvidia

# Link setup scripts to home dir from config
ln -fs $hdir/.config/.zshrc $hdir/.zshrc
ln -fs $hdir/.config/.p10k.zsh $hdir/.p10k.zsh
ln -fs $hdir/.config/.vimrc $hdir/.vimrc
ln -fs $hdir/.config/.xinitrc $hdir/.xinitrc

cp $hdir/.config/.p10k_root.zsh /root/.p10k.zsh
cp $hdir/.config/.zshrc /root



# Flatpak install and pacakges 
sudo dnf -y install flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# Uncomment what you want
# flatpak install -y flathub com.valvesoftware.Steam
# flatpak install -y flathub md.obsidian.Obsidian
# flatpak install -y flathub com.obsproject.Studio
# flatpak install -y flathub com.discordapp.Discord
# flatpak install -y flathub com.microsoft.Teams
# flatpak install -y flathub com.valvesoftware.SteamLink
# flatpak install -y flathub org.wireshark.Wireshark

# Dir and OS changes
mkdir -p $hdir/Music
mkdir -p $hdir/Images/screenshots
mkdir -p $hdir/.app/edge_outlook
mkdir -p $hdir/.app/edge_teams
mkdir -p $hdir/.app/chromium_plex
mkdir -p $hdir/.app/chromium_netflix
mkdir -p $hdir/.app/chromium_geforce

cp $hdir/.config/background.jpg $hdir/Images/

chmod -R 755 $hdir/.oh-my-zsh/custom/plugins/zsh-autosuggestions
chmod -R 755 $hdir/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

chown -R $uname:$uname $hdir

# Notification won't work without allowing DBUS to bet set
sed -i 's/unset\ DBUS_SESSION_BUS_ADDRESS/#unset\ DBUS_SESSION_BUS_ADDRESS/g' /usr/bin/startx