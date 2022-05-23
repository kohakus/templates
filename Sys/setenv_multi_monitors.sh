# NOW LET US SOLVE A BIG PROBLEM
# If you have multiple monitors, you may find that only one of them is working now.
# How to lighting another monitor?
# First check
lspci | grep VGA
# Here I only find single NVIDIA device, Intel one is not found!
# Hence, if I use the official recommended bumblebee, it will not work.
# In another way, I can use Nvidia as primary output source instead of Intel, so try Nvidia-Prime.
# [Reference]: https://forum.manjaro.org/t/howto-set-up-prime-with-nvidia-proprietary-driver/40225
# (1). Install nvidia driver (do this if you select 'free' when installing system. Just skip this step if 'non-free' was seleted.)
sudo mhwd -i pci video-nvidia
# (2). Revise mhwd settings
# - delete /etc/X11/xorg.conf.d/90-mhwd.conf
# - create a new 90-mhwd.conf that contains
# ---------------------------------------------------
Section "Module"
    Load "modesetting"
EndSection

Section "Device"
    Identifier "nvidia"
    Driver "nvidia"
    BusID "PCI:1:0:0"
    Option "AllowEmptyInitialConfiguration"
EndSection
# ----------------------------------------------------
# Note that the BusId should be replaced, check lspci | grep -E "VGA|3D"
# (3). Reset blacklist and enable nvidia-drm.modeset
# - delete two files under /etc/modprobe.d/
sudo rm /etc/modprobe.d/mhwd-gpu.conf
sudo rm /etc/modprobe.d/mhwd-nvidia.conf
# - create /etc/modprobe.d/nvidia.conf that contains
# -----------------------------------------------------
blacklist nouveau
blacklist nvidiafb
blacklist rivafb
# -----------------------------------------------------
# - create /etc/modprobe.d/nvidia-drm.conf that contains
# -----------------------------------------------------
options nvidia_drm modeset=1
# -----------------------------------------------------
# (4). Set Lightdm display output source
# - create a file /usr/local/bin/optimus.sh that contains
# -----------------------------------------------------
#!/bin/sh

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
# -----------------------------------------------------
# and set this
sudo chmod a+rx /usr/local/bin/optimus.sh
# - modify /etc/lightdm/lightdm.conf, adding the following line to [Seat:*] term
display-setup-script=/usr/local/bin/optimus.sh
# (5). OK, reboot and check if it works.
# If your setting is correct, the other monitor will work now.
# However, what is shown on that monitor is the same as primary one.
# Just use arandr to change the manner: save arandr setting in ~/.screenlayout and exec it in i3 config file.