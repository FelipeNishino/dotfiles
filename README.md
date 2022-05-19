## Graphical environment

X server will be used with the dwm WM, install the needed packages with the following command.  
```
sudo pacman -S xorg-server xinit xorg-xrdb feh dunst picom numlockx xclip dmenu imlib2 libxft libxinerama
```

Each of the packages are explained bellow
- xorg-xrdb: utility for using the .Xresources file, a tool for used for theming.
- feh: image viewer, used by dwm for setting a desktop background.
- dunst: notification manager.
- picom: compositor, needed for transparency and some visual effects.
- numlockx: cli tool for toggling numlock.
- xclip: cli access to the X11 clipboard.
- dmenu: application launcher used by dwm.
- imlib2, libxft, libxinerama: some dependencies for dwm, you don´t necessarily need these if not using dwm.

It is recommended to install drivers for your gpu, take a look into the arch wiki to find out which one you'll need.

### DWM

For dwm I have my own fork, which has some patches that I like already applied and ready for install, for more informations take a look at the repo.

- Clone the repo and cd into it
```
git clone https://github.com/felipenishino/dwm.git
cd dwm
```

- Make and install dwm
```
sudo make clean install
```

My dwm fork uses st as a terminal emulator, so that is also needed. For st's installation, just repeat the steps for dwm.
```
git clone https://github.com/felipenishino/st.git
cd st
sudo make clean install
```

## Audio server

For the audio server, I prefer using pipewire, which is a newer graph-based framework for audio management

- Install the base framework and compatibility for ALSA, jack and PulseAudio
```
sudo pacman -S pipewire pipewire{alsa,pulse,jack}
```

- Install the session manager
```
sudo pacman -S wireplumber
```

### Graphical front-ends

- Helvum is a really basic package for managing your session's graphs
```
sudo pacman -S helvum
```

- Pavucontrol can be used for managing volume levels and setting default devices
```
sudo pacman -S pavucontrol
```

## Rustup

- Run the following command:
```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

## Paru

- Clone paru repo and cd into it
```
git clone https://aur.archlinux.org/paru.git
cd paru
```

- Make and install Paru package with
```
makepkg -si
```

## Github

- Generate an ssh-key for your github email
```
ssh-keygen -t ed25519 -C "your_email@example.com"
```

- Ensure ssh-agent is running
```
eval "$(ssh-agent -s)"
```

- Add tour newly generated key to you ssh-agent
```
ssh-add ~/.ssh/id_ed25519
```

- Get your public key and add it to your github account

```
cat ~/.ssh/id_ed25519.pub
```

- (Optional) Install lazygit for a nice TUI
```
sudo pacman -S lazygit
```

## Sublime Text

- Add Sublime Text's gpg key
```
curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
```

- Add repo to pacman
```
echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf
```

- Install with pacman
```
sudo pacman -Syu sublime-text
```

## GTK themes

- Install some GTK theme
```
paru catppuccin-gtk-theme
```

- Install lxappearance for managing themes
```
sudo pacman -S lxappearance
```

## Fonts and icons

- Font for IDEs with nice ligatures
``` 
sudo pacman -S ttf-cascadia-code
```

- Font for getting a lot of unicode characters (used in the dwm bar.sh script)
``` 
sudo pacman -S ttf-font-awesome
```

- Font for japanese characters compatibility (enable ja_JP.UTF-8 in /etc/locale.gen)
```
sudo pacman -S otf-ipafont
```

- Font for korean characters compatibility (enable ko_KR.UTF-8 in /etc/locale.gen)
```
sudo pacman -S ttf-baekmuk
```

## QEMU:

- Install the following packages
```
sudo pacman -S qemu virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat
```

- Enable the libvirtd service
```
sudo systemctl enable libvirtd
```

- Vim into /etc/libvirt/libvirtd.conf and uncomment the lines
``` 
sudo vim /etc/libvirt/libvirtd.conf
#unix_sock_group = "libvirt"
#unix_sock_ro_perms = "0777"
#unix_sock_rw_perms = "0770"
```

- Add user to libvirt group 
```
eval sudo usermod -aG libvirt $(whoami)
```

## Steam

This part of the guide assumes that you have a nvidia GPU.

- Enable multilib repo on /etc/pacman.conf
```
sudo vim /etc/pacman.conf
# Uncomment the following lines
[multilib]
Include = /etc/pacman.d/mirrorlist
```

- Install the following packages:
```
sudo pacman -S steam ttf-liberation wqy-zenhei nvidia-utils lib32-nvidia-utils
```  

Each of the packages are explained bellow
- ttf-liberation: replacement font fot microsoft's arial font family.
- wqy-zenhei: support for asian characters.
- nvidia-utils/lib32-nvidia utils: compositor, needed for transparency and some visual effects.

## Random assortment of programs

### File Managers

- Pcmanfm: Light-weight graphical file manager
```
sudo pacman -S pcmanfm
```

### IDEs and text editors

- VSCodium: Just VScode without the telemetry bullshit
```
paru vscodium-bin
```

### Utility

- MSPaint like software;
```
sudo pacman -S pinta
```

### Communication

- Discord
```
sudo pacman -S discord
```

### Password management

- Bitwarden (cloud-based)
```
sudo pacman -S bitwarden
```

- KeepassXC (local-database)
```
sudo pacman -S keepassxc
```

### VPN

- Mullvad
```
paru mullvad-vpn
```

### Synchronization and Backups

- Nextcloud
```
sudo pacman -S nextcloud
```

**Note:** if using nextcloud, it is recommended to install gnome-keyring for session management. Otherwise, user login will be needed on every session.
```
sudo pacman -S gnome-keyring
```

## Common problems

- **Using pacman fails with errors on gpg keys**
Update archlinux-keyring before attempting any other transactions.


