# Close Beep
# Beep is noisy. To close it, use this command
sudo rmmod pcspkr
# ----------------------------------------------------


# Wine
# if you need to execute .exe file
# First check /etc/pacman.conf, and uncomment [mutilib] item;
# Then install wine:
sudo pacman -S wine winetricks wine-mono wine_gecko
# ----------------------------------------------------------------


# Dns utils
sudo pacman -S dnsutils
# -----------------------------