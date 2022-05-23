# Install TeXLive
sudo pacman -S texlive-most texlive-lang
# ---------------------------------------------------


# Screenshot utils
sudo pacman -S flameshot
sudo pacman -S peek
# ----------------------------


# Web Browser
sudo pacman -S chromium
# ----------------------------


# Guake terminal
# another terminal choice
sudo pacman -S guake
# and set zsh as the interpreter && iosevka font && theme::Tomorrow Night && i3 key-binding
# --------------------------------------------------------------------------------------------


# 3D construction, point cloud and etc.
yay -S pcl
sudo pacman -S blender
sudo pacman -S qgis
sudo pacman -S cgal
yay -S openmesh
yay -S meshlab
# install open3d python binding for a proper conda env
conda install -c open3d-admin open3d
# --------------------------------------------------------------------------------------------


# MySQL (MariaDB)
sudo pacman -S mariadb
mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
systemctl start mysqld.service
mysql_secure_installation
systemctl enable mysqld
mysql -uroot -p
# --------------------------------------------------------------------------------------------


# OpenGL related Libs
# First we build and install GLFW (instead of old GLUT)
# Download source code from https://www.glfw.org/download.html
# Now cd to that folder, and follow these steps:
mkdir build
cd build
cmake ..
make
sudo make install
# Now GLFW has been installed.
# Then we should try it with examples.
# Compile example like this:
#    g++ -o run.out example.cpp glad.c -lglfw3 -lGL -lX11 -lpthread -lXrandr -lXxf86vm -lXinerama -lXcursor -lXi -ldl
# If get an error like "usr/bin/ld: cannot find -lglfw3",
# Then you should check if install destination is /usr/local/lib64 (while we need /usr/local/lib)
# If so, just move them to /usr/local/lib, the problem should be solved.
# We can also install glfw as package so that they can be found in pkg-config easily:
sudo pacman -S glfw-x11
# Now we install GLAD. (can be some other libs, like GLEW or GL3W, but here we recommand GLAD)
# First download a proper version from http://glad.dav1d.de/
# note that we should choose these options: (or options according to your opengl version)
#    Language: 'C/C++'
#    Specification: 'OpenGL'
#    API::gl: 'version xxx' (xxx >= 3.3)
#    Profile: 'Core'
# and then it will give us a folder that contains /include and /src, we can use them in our projects.
# Install GLM lib
sudo pacman -S glm
# ---------------------------------------------------------------------------------------------------------------------------


# Install Mathematica
# check this page to install: http://support.wolfram.com/kb/12453?lang=en
# There may exist some compatibility issues like this:
# "Symbol lookup error: /usr/lib/libfontconfig.so.1: undefined symbol: FT_Done_MM_Var"
# To solve this problem, following archwiki:
cd <INSTALL_DIR>/SystemFiles/Libraries/Linux-x86-64
mv libfreetype.so.6 libfreetype.so.6.old
mv libz.so.1 libz.so.1.old
# ------------------------------------------------------------------------------------------------------


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