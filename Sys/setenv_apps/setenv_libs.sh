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


# 3D Processing
yay -S pcl
sudo pacman -S cgal
yay -S openmesh
# install open3d python binding for a proper conda env
conda install -c open3d-admin open3d
# --------------------------------------------------------------