after installation steps
ttf-font-awesome
ttf-cascadia-code
install otf-ipafont for japanese characters compatibility
setup audio installation
- pipewire pipewire{alsa,pulse,jack} wireplumber helvum pavucontrol
install git
install xorg-server and xinit

setup graphical envirnoment
dmenu
feh
notification manager - dunst
compositor - picom
dwm
imlib2, libxft, libxinerama
numlockx
nvidia

## Github

- Generate an ssh-key for your github email
`ssh-keygen -t ed25519 -C "your_email@example.com"`

- Ensure ssh-agent is running
`eval "$(ssh-agent -s)"`

- Add tour newly generated key to you ssh-agent
`ssh-add ~/.ssh/id_ed25519`

- Get your public key and add it to your github account
`cat ~/.ssh/id_ed25519.pub`

## Sublime Text

- Add Sublime Text's gpg key
`curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg`

- Add repo to pacman
`echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf`

- Install with pacman
`sudo pacman -Syu sublime-text`

gnome-keyring for compatilbility with some applications (nextcloud)

discord

lazygit

virtualization:
qemu virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat
enable libvirtd service
/etc/libvirt/libvirtd.conf uncomment unix sock group, ro and rw permissions
add user to libvirt group sudo usermod -aG libvirt nishi
