echo"""Basically this will setup xorg and dwm with some other useful things you might need for your journey"""
echo"""Updating System"""
sudo xbps-install -Su
sudo xbps-install -Su
echo"""Installing Packages"""
sudo xbps-install -S xorg git curl wget firefox base-devel libX11-devel libXft-devel libXinerama-devel bash-completion vim nitrogen
echo"""Cloning the repos"""
git clone https://git.suckless.org/dwm
git clone https://github.com/LukeSmithxyz/st
git clone https://git.suckless.org/dmenu
git clone https://sarcasticdream/.xinitrc
echo"""Compiling the shiz"""
cd ~/dwm
sudo sed -i '/X11INC = usr/X11R6/include/X11INC = usr/include/X11/g' config.mk
sudo sed -i '/X11LIB = usr/X11R6/lib/X11LIB = usr/lib/X11/g' config.mk
cd ~/st
sudo make clean install
cd ~/dmenu
sudo make clean install
touch .xinitrc
echo """
Put this in your .xinitrc file I suck at scripting!

while true; do
    xsetroot -name "$(date)"
    sleep 2
done &
nitrogen --restore &
xrandr -s 1920x1080 &
exec dwm
"""
