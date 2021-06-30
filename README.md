# Personal Sway Config


## Base Built and package install
Base build, built on top of Fedora Server Minimal...

https://getfedora.org/en/server/download/

Download, and select minimal install.

In this case Fedora 33.

```sh
#!/bin/sh

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

# Install Base
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

sudo systemctl enable wpa_supplicant.service
sudo systemctl start wpa_supplicant.service

echo "export EDITOR='vim'" >> ~/.bashrc
```


## Pull config
```sh
cd ~
git clone https://github.com/unites/.config.git
```

## Misc Required

Also Need to do the following...

```sh
# Install Oh My ZSH
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo usermod -s $(which zsh) $USER

# Fun Plugins for OhMyZSH
cd ~
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# P10k for ohmyzsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

chmod -R 755 ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
chmod -R 755 ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# This is to use the gnome keyrings
sudo vi /etc/pam.d/login
# Add just after last auth entry
auth       optional     pam_gnome_keyring.so

# Nerd Fonts, my favs
cd ~
git clone --depth=1 https://github.com/ryanoasis/nerd-fonts ~/.nerd-fonts
cd .nerd-fonts 
./install.sh Hack
./install.sh Terminus
./install.sh HeavyData


# Switch Shell, because chsh is not installed
which zsh
sudo lchsh -i
# Set user to docker group
sudo usermod -aG docker $USER
# MPD and Background vars need this.  Would suggest throwing a background.jpg in the Images Dir.
mkdir -p ~/Music
mkdir -p ~/Images/screenshots
```

## Warning, there be dragons here
This is a Copr repo, meaning you need to trust the provider.  This package allows creation of virtual video streams to get around the inability of wayland to screen share in web apps.
https://copr.fedorainfracloud.org/coprs/sentry/v4l2loopback/
```sh
dnf copr enable sentry/v4l2loopback

 ```

## Wireless
### For Desktop
https://wiki.archlinux.org/title/Network_configuration/Wireless#Device_driver

firmware
```sh
sudo dnf install iwl3160-firmware -y
```

## I3

```sh
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
```


yum install akmod-nvidia xorg-x11-drv-nvidia-libs kernel-devel acpid

https://www.if-not-true-then-false.com/2013/fedora-19-nvidia-guide/


## Arch Linux

```
pacman -Sy sway \
swaylock \
swayidle \
waybar \
wl-clipboard \
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
rsync \
cifs-utils \
light \
mako \
ranger \
vim \
chromium \
libgnome-keyring \
nautilus \
seahorse \
gnome-keyring \
libsecret \
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
wildmidi \
wf-recorder \
ffmpeg \
freerdp \
nm-connection-editor \
syncthing \
gnome-bluetooth \
gnome-logs \
blueman \
ksystemlog \
ghostwriter \
gimp \
id3v2 \
pciutils \
gnome-system-monitor \
ksystemlog \
vinagre \
i3 \
i3status \
dmenu \
i3lock \
conky \
gnome-connections \
kbd \
rofi \
xss-lock \
xautolock \
compton \
nitrogen \
flameshot \
maim \
xclip \
dunst \
gnome-icon-theme 

yay -S microsoft-edge-dev \
brave-bin \
brave-beta-bin \
brave-nightly-bin \
google-chrome


error: target not found: fira-code-fonts
error: target not found: fontawesome-fonts
error: target not found: bind-utils
error: target not found: sublime-text
error: target not found: firefox-wayland
error: target not found: google-chrome-stable
error: target not found: python3-pip
error: target not found: pulseaudio-utils
error: target not found: bdf2psf
error: target not found: otf2bdf
error: target not found: NetworkManager-bluetooth
error: target not found: NetworkManager-wifi
error: target not found: NetworkManager-tui
error: target not found: fuse-sshfs
error: target not found: brave-browser
error: target not found: microsoft-edge-dev
error: target not found: microsoft-edge-beta
error: target not found: python3-gobject
error: target not found: rsyslog
error: target not found: google-noto-emoji-color-fonts
error: target not found: google-noto-emoji-fonts
error: target not found: clipman
error: target not found: remotely
error: target not found: ckb-next
error: target not found: xrandr
error: target not found: ImageMagick
error: target not found: xset
error: target not found: polybar
error: target not found: qt-qdbusviewer.x86_64
error: target not found: gnome-shell-extension-caffeine

```


```sh
lsblk

timedatectl set-ntp true

droot=sda
label_name=alpha
namehost=excalibur

# May need to use LV tools to remove lv/vgs from disk before running below

wipefs -fa /dev/${droot}

parted -s /dev/${droot} mklabel gpt

parted /dev/${droot} mkpart ESP fat32 1MiB 512MiB
mkfs.fat -F32 /dev/${droot}1

#parted -sa opt /dev/${droot} mkpart primary ext4 0% 100%
parted -sa opt /dev/${droot} mkpart primary ext4 512MiB 100%
mkfs.ext4 -L ${label_name} /dev/${droot}2

mount /dev/${droot}2 /mnt
mkdir /mnt/boot
mount /dev/${droot}1 /mnt/boot

pacstrap /mnt base linux linux-firmware

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt

ln -sf /usr/share/zoneinfo/America/Chicago /etc/localtime

hwclock --systohc

sed -i 's/^#en_US.UTF/en_US.UTF/g' /etc/locale.gen
locale-gen

echo "LANG=en_US.UTF-8" > /etc/locale.conf

echo "${namehost}" > /etc/hostname
echo "127.0.0.1 localhost" > /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 ${namehost}.localdomain ${namehost}" >> /etc/hosts

cat /etc/hostname
cat /etc/hosts

mkinitcpio -P

pacman -Sy grub os-prober efibootmgr vi vim git --noconfirm

grub-install --efi-directory=/boot
grub-mkconfig -o /boot/grub/grub.cfg

pacman -S git base-devel

useradd -m ${user_accnt}
passwd ${user_accnt}

visudo

# remove wheel section comments

su - ${user_accnt}

cd yay/  
makepkg -sri

yay -S microsoft-edge-dev \
brave-bin \
brave-beta-bin \
brave-nightly-bin \


passwd


# probably want to copy .config out now

# Also need to create script that does the following...

systemctl enable NetworkManager
systemctl enable sshd.service
systemctl start NetworkManager
systemctl start sshd.service

```