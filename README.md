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
- rofi (optional): eye-candy, can be used instead of dmenu.
- imlib2, libxft, libxinerama: some dependencies for dwm, you don´t necessarily need these if not using dwm.

It is recommended to install drivers for your gpu, take a look into the arch wiki to find out which one you'll need.

### DWM

For dwm I have my own fork, which has some patches that I like already applied and ready for install alongside integration with dwmblocks, for more informations take a look at the repo.

- Clone the repo and cd into it
```
git clone https://github.com/felipenishino/dwm.git
cd dwm
```

- Make and install dwm
```
sudo make clean install
```

My dwm fork uses st as the terminal emulator, so that is also needed. For st's installation, just repeat the steps for dwm.
```
git clone https://github.com/felipenishino/st.git
cd st
sudo make clean install
```

### Yakuake (Dropdown terminal)

Yakuake is used as a persistent terminal called with F12. Install the following packages and get the dotfiles from my dotfiles repo.
```
sudo pacman -S yakuake konsole
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

- Qpwgraph provides a slightly more advanced UI for managing graphs
```
sudo pacman -S qpwgraph
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

- Install some GTK themes
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
- ttf-liberation: replacement font for microsoft's arial font family.
- wqy-zenhei: support for asian characters.
- nvidia-utils/lib32-nvidia utils: compositor, needed for transparency and some visual effects.


## Retroarch

Super nice all-around emulator.

- Install the following packages
```
sudo pacman -S retroarch libretro-core-info retroarch-assets-{ozone,xmb}
```

- Set file paths to local directory on \~/.config/retroarch/retroarch.cfg
```
~/.config/retroarch/retroarch.cfg
libretro_directory = "~/.config/retroarch/cores"
libretro_info_path = "~/.config/retroarch/cores/info"
```

- Make sure to copy /usr/share/libretro/info folder to the path for on the libretro_info_path.cfg
```
cp -r /usr/share/libretro/info ~/.config/retroarch/cores/info
```

- Enabling the "Online Updater"
```
vim ~/.config/retroarch/retroarch.cfg
# Set the following line to true
menu_show_core_updater = "true"
```

# Random assortment of programs

## Browsers

- Firefox: Overall great privacy-focused browser without sacrificing too much usability
	- Recommended Extensions: ublock origin, bitwarden, multi-account containers, skip redirect, temporary containers
```
sudo pacman -S firefox
```
- Brave: Chromium-based privacy-focused browser
```
paru brave-bin
```

---

## Cloud and Synchronization

- Nextcloud
```
sudo pacman -S nextcloud
```

**Note:** if using nextcloud, it is recommended to install gnome-keyring for session management. Otherwise, user login will be needed on every session. (Check arch wiki for install instructions) (VERIFY)
```
sudo pacman -S gnome-keyring
```

---

## Common Tools

- Handlr: Used for setting application defaults

```
sudo pacman -S handlr
```

---

## Communication

- Discord
```
sudo pacman -S discord
```

---

## Development

### IDEs

- VSCodium: Just VScode without the telemetry bullshit
	- Extensions: Catppuccin, Material Theme Icons, clangd, prettier
```
paru vscodium-bin
```

- Android Studio: Android focused IDE
```
paru android-studio
```

### Tools

- Valgrind: Memory debugger for C programs
```
sudo pacman -S valgrind
```

---

## File Managers

- Pcmanfm: Light-weight graphical file manager
```
sudo pacman -S pcmanfm
```

Set as default application for opening folders:
```
handlr set inode/directory pcmanfm.desktop
```

---

## Mail client

- thunderbird: Mozilla mail client
```
sudo pacman -S thunderbird
```

---

## Media

- OBS: Recording and Live-streaming suite
``` 
sudo pacman -S obs-studio v4l2loopback-dkms
sudo usermod -aG video $(whoami)
```

---

## Music

- Spotify: Proprietary music streaming client
	- [Spicetify](https://github.com/spicetify): client customizations
``` 
paru spotify
```

---

## Utility

- Krita: Powerfull FOSS alternative to photoshop
```
sudo pacman -S krita
```

- Pinta: MSPaint like software
```
sudo pacman -S pinta
```

- scrcpy: Software for mirroring and controlling android devices through adb
```
sudo pacman -S scrcpy
```

- termdown: Lightweight TUI countdown
```
sudo pacman -S termdown
```


---

## Password management

- Bitwarden (cloud-based)
```
sudo pacman -S bitwarden
```

- KeepassXC (local-database)
```
sudo pacman -S keepassxc
```

---

## VPN

- Mullvad
```
paru mullvad-vpn-bin
```

---

## Common problems

- **Using pacman fails with errors on gpg keys**: 
Update archlinux-keyring before attempting any other transactions.


