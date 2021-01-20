# Personal Sway Config

## Pull config
```sh
cd ~
git clone https://github.com/unites/sway_config.git
```
## Base Built and package install
Base build, built on top of Fedora Server Minimal...
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
wildmidi 

# Desktop Heavy (optional)
sudo dnf -y install nextcloud-client \
docker-ce \
docker-ce-cli \
containerd.io \
obs-studio 

echo "export EDITOR='vim'" >> ~/.bashrc
```

Also Need to do the following...

```sh
sudo vi /etc/pam.d/login
# Add just after last auth entry
auth       optional     pam_gnome_keyring.so

cd ~
git clone --depth=1 https://github.com/ryanoasis/nerd-fonts ~/.nerd-fonts
cd .nerd-fonts 
sudo ./install.sh Hack
sudo ./install.sh Terminus


which zsh
sudo lchsh -i

sudo usermod -aG docker $USER

mkdir -p ~/Music
mkdir -p ~/Images/screenshots
```

