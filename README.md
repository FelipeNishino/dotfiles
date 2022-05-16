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

gnome-keyring for compatilbility with some applications (nextcloud)

discord

lazygit

virtualization:
qemu virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat
enable libvirtd service
/etc/libvirt/libvirtd.conf uncomment unix sock group, ro and rw permissions
add user to libvirt group sudo usermod -aG libvirt nishi
