# Personal Sway Config

Base build, built on top of Fedora Server Min...
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

# Install Base
sudo dnf -y install sway \
feh \
fira-code-fonts \
fontawesome-fonts \
powerline-fonts \
light \
mako \
pulseaudio \
pavucontrol \
ranger \
swaylock \
swayidle \
waybar \
wl-clipboard \
mpc \
rsync \
grim \
slurp \
zsh \
git \
curl \
wget \
firefox-wayland \
fzf \
chromium \
wofi \
vlc \
vim \
wildmidi \
libgnome-keyring \
cifs-utils \
nautilus \
seahorse \
gnome-keyring \
libsecret \
google-chrome-stable \
sublime-text \
python3 \
python3-pip \
ruby \
nodejs \
tar \
mpd \
ncmpcpp \
mpv

# Desktop Heavy (optional)
sudo dnf -y install nextcloud-client \
docker-ce \
docker-ce-cli \
containerd.io \
obs-studio 
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

