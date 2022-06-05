# Dns utils
sudo pacman -S dnsutils
# -----------------------------


# Install TeXLive
sudo pacman -S texlive-most texlive-lang
# ---------------------------------------------------


# Wine
# if you need to execute .exe file
# First check /etc/pacman.conf, and uncomment [mutilib] item;
# Then install wine:
sudo pacman -S wine winetricks wine-mono wine_gecko
# ----------------------------------------------------------------


# Qt (as a lightweight Cpp IDE or other use: GUI programming ...)
# follow this link to install: https://wiki.archlinux.org/index.php/Qt
sudo pacman -S qt5-base qt5-doc
sudo pacman -S qtcreator
# After installation, use the following setting for a better editor env:
# choose Tools -> Options..
# - Environment: use "Flat Dark" Theme;
#                use "urxvt" as Terminal;
# - Text Editor: use "Sarasa Term SC Light" Font with size "12";
#                use "Qt Creator Dark" Color Theme;
# - C++: use "GNU (built-in)" Code Style;
# - Build & Run: write your own project default Directory.
# --------------------------------------------------------------------------


# Guake terminal
# another terminal choice
sudo pacman -S guake
# and set zsh as the interpreter && iosevka font && theme::Tomorrow Night && i3 key-binding
# ----------------------------------------------------------------------------------------------