# 2022/05/22
# Another development environment setting memo.
# System OS : Manjaro
# DE : no DE :)
# WM : i3
# GTK Theme: Adapta-Nokto-Eta-Maia
# Icon Theme: Papirus-Adapta-Nokto-Maia
#
#------------------------------------------------------
# fonts:
#     system: sarasa-mono-sc-regular
#     editor: iosevka-cc-slab-extralight / Sarasa Term SC
#     CJK for latex: Source Han Serif SC
#------------------------------------------------------


# **Installation**
# First install Manjaro (with WM or DE) from mirror file.
# If you cannot see anything on screen, perhaps you should set GPU driver 'nonfree' instead of installing open-source one.
# Then, just divide the disk space as what you did before when installing other Linux releases.
# Wait a moment, the installation will be done.
# After installation, you can find the corresponding GPU information in screenfetch result,
# we need not to install GPU driver by ourselves, manjaro has done it for us.
# Of course, we can manage linux kernel version and device settings in `manjaro-settings-manager`.
# -----------------------------------------------------------------------------------------------------------------------------


# **Setting Package Source**
# you can list all mirrors by using
sudo pacman-mirrors -g
# here I just use China mirror, hence just do
sudo pacman-mirrors -i -c China -m rank
# and select one (or several) from the mirror list.
# you may also need arch Source, hence do something to set archlinux source
sudo vim /etc/pacman.conf # open this file for modifying
# here I add two lines below in this file
# [archlinuxcn]
# Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch

# Renewing Source (!!! never run -Sy below, but always use -Syu !!!)
sudo pacman -Sy # this step only synchronize packages, partial upgrades
# renew the whole system. Do not forget to add arch key
sudo pacman -Syu && sudo pacman -S archlinuxcn-keyring
# yaourt is old, we can install yay for replacing
sudo pacman -S yay
# try to use yay, for example, install typora (just for validating)
yay -S typora
# It works!
# Note that if you complete these renewing steps, the GPU driver may not match current system settings,
# don't worry about that, just reboot and the driver will upadate to the newest version.
# Moreover, if you like, octopi can be helpful for installing softwares.

# try key refresh to solve signature problem (optional)
sudo pacman-key --refresh-keys
# if refresh keys does not work, try:
sudo rm -rf /etc/pacman.d/gnupg
sudo pacman-key --init
sudo pacman-key --populate archlinux
sudo pacman-key --populate manjaro
sudo pacman -Syu
# ----------------------------------------------------------------------------------------------------------


# **Chinese typing support**
sudo pacman -S fcitx-im # full selection
sudo pacman -S fcitx-configtool
sudo pacman -S fcitx-googlepinyin # (can be another one)
# then add the following lines in ~/.xprofile
# --------------------------------------------------
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
exec fcitx &
# --------------------------------------------------


# **Font settings**
# install font viewer
sudo pacman -S gnome-font-viewer
# install gtk2fontsel for listing xft fonts
sudo pacman -S gtk2fontsel
# First install Iosevka and Sarasa-Gothic
sudo pacman -S ttc-iosevka
sudo pacman -S ttf-sarasa-gothic
# set i3-bar font, modify $HOME/.i3/config
font xft:Sarasa Term SC 11
# then, set Urxvt font, modify ~/.Xresources
URxvt.font:xft:Sarasa Term SC:antialias=True:pixelsize=15
# and renew Urxvt config
xrdb -load ~/.Xresources
# If some command cannot work, with error 'rxvt-unicode-256color': unknown terminal type.
# Just modify ~/.zshrc, adding the following line.
export TERM='xterm-256color'
# install some other font packages
sudo pacman -S adobe-source-han-serif-cn-fonts adobe-source-han-serif-tw-fonts adobe-source-han-serif-jp-fonts
yay -S ttf-ms-fonts
yay -S ttf-mac-fonts
pacman -S ttf-font-awesome
pacman -S nerd-fonts-complete
# Enjoy new fonts!
# ---------------------------------------------------------------------------------------------------------------


# **zsh and oh-my-zsh**
# zsh is pre-installed in my i3 version, but oh-my-zsh setting is still needed.
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# then change oh-my-zsh theme by modifying ~/.zshrc
ZSH_THEME="myys"
# ---------------------------------------------------------------------------------------------------------------


# **Conky prompt information**
# If you don't want to show prompt inforamtions about i3wm,
# just modify /usr/share/conky/conkyxx_shortcuts_maia, comment those lines in conky.text
# you can also change the color in conky_maia, recommend #FAEBD7
# -----------------------------------------------------------------------------------------------


# **Startup settings**
# - Wallpaper setting
exec --no-startup-id feh --bg-scale "$HOME/Pictures/wallpaper/wallpaper.jpg"
# if this not work, set a picture in lightdm-settings, and delete default background pictures
sudo rm /usr/share/backgrounds/*
# - Using picom(compton) to set transparent. Just modify ~/.config/picom.conf, uncomment opacity/fading terms.
# The default picom configuration file can be found in /etc/xdg/
# - Don't forget to install feh
pacman -S feh
# ---------------------------------------------------------------------------------------------------------------


# Optional: Install Cuda & Cudnn
# This step is very relaxed in manjaro!
# Here is an example of cuda10 & cudnn7, the version is up to you.
# - install cuda:
pacman -S cuda-10.0 # we select v-10.0 here, if you like, just use `pacman -S cuda` to install the newest version
# then add Paths to ~/.zshrc
export CUDA_HOME=/opt/cuda
export PATH=/opt/cuda/bin:$PATH
export LD_LIBRARY_PATH=/opt/cuda/lib64:$LD_LIBRARY_PATH
# check cuda runtime version
nvcc -V
# check with an example
cd /opt/cuda/samples/1_Utilities/deviceQuery
sudo make
./deviceQuery
# - install cudnn:
pacman -S cudnn7 # as before, if you like, just use `pacman -S cudnn`
# Done. reboot.
# -----------------------------------------------------------------------------------------------------------------------