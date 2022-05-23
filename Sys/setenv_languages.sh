# Install python env - via Anaconda
# First download installation file, recommend to search the install file from a mirror site (e.g. USTC Mirror)
# Then, follow the install steps on "http://docs.anaconda.com/anaconda/install/linux/"
# Don't forget to add install location to PATH in $HOME/.zshrc, we can copy that from $HOME/.bashrc
source ~/.zshrc
# Try it now:
conda info --envs # or `conda env list`
conda list
# So the Anaconda is installed.
# We can also reset the source:
conda config --add channels https://mirrors.ustc.edu.cn/anaconda/pkgs/free/
conda config --set show_channel_urls yes
# Try it again, the download is very fast now.
########################################################################################
## *TIPs*                                                                             ##
## - check installed packages of current env: `conda list`                            ##
## - check existing envs: `conda env list`                                            ##
## - create a new env with some packages: `conda create -n "env-name" xxx xxx ...`    ##
## - create a new env by yaml file: `conda env create -f xxx.yaml`                    ##
## - export env configuration as yaml: `conda env export > xxx.yaml`                  ##
## - change current active env: `conda activate "env-name"`                           ##
## - leave current env: `conda deactivate`                                            ##
## - delete a specific env: `conda env remove -n "env-name"`                          ##
## - remove cached package tarballs: `conda clean -t`                                 ##
## - remove unused cached packages: `conda clean -p`                                  ##
## - update packages of current env: `conda update xxx`                               ##
## - install new packages to current env: `conda install xxx`                         ##
## - remove packages from current env: `conda remove xxx`                             ##
########################################################################################
#
# Deep Learning env
# for example, we can use conda to create a tensorflow environment
conda create -n tensorflow_gpuenv tensorflow-gpu
# activate this environment
conda activate tensorflow_gpuenv
# Then just install packages you want by using
conda install XXX # e.g. conda install matplotlib
# !! HOWEVER, I recommend to build envs from yml config file directly,
# there is a pytorch example in torch.yml
# -----------------------------------------------------------------------------------------------------------------------


# Golang
# following the installation instructions on ArchWiki: https://wiki.archlinux.org/index.php/Go
sudo pacman -S go
sudo pacman -S go-tools
# -----------------------------------------------------------------------------------------------------------


# NVM for JSer
sudo pacman -S nvm
echo 'source /usr/share/nvm/init-nvm.sh' >> ~/.zshrc
exec $SHELL
# after nvm is installed, use following code to install latest release of node
nvm install node
# then use
nvm use node
# to check the node version. the npm should also be installed correctly.
npm -v
# to check the installed instances of nvm, just use
nvm ls
# If you need Typescript
npm install -g typescript
# ----------------------------------------------------------------------------------------------


# Ruby for rubyist
sudo pacman -S ruby
gem sources --add https://gems.ruby-china.com/ # replace to China gem source
gem sources --remove http://rubygems.org/ # delete old source
gem install rails
gem install jekyll
gem install bundler # If you don't have bundler installed
gem install github-pages
gem install kramdown
# ----------------------------------------------------------------------------------------------


# Haskell
sudo pacman -S stack
sudo pacman -S ghc
# then change source, reference:
# Stackage: https://mirrors.ustc.edu.cn/help/stackage.html
# Hackage: https://mirrors.ustc.edu.cn/help/hackage.html
# --------------------------------------------------------------------------


# Agda
sudo pacman -S agda
sudo pacman -S agda-stdlib
# Now agda will be installed at /usr/share/agda
# and agda-stdlib will be installed at /usr/share/agda/lib/stdlib
# To use the standard library by default, you have to do two things
# 1. create file ~/.agda/libraries with AGDA_STDLIB/standard-library.agda-lib
echo "/usr/share/agda/lib/standard-library.agda-lib" >> ~/.agda/libraries
# 2. create file ~/.agda/defaults with your default lib (we use standard library here)
echo "standard-library" >> ~/.agda/defaults
# ----------------------------------------------------------------------------------------------


# Racket
sudo pacman -S racket
# ------------------------------------------------


# Rust
# Following the official method: https://www.rust-lang.org/tools/install
curl https://sh.rustup.rs -sSf | sh
# and add the path to zshrc.
# then install racer
cargo install racer
# note that you may meet the error like this:
"#![feature] may not be used on the stable release channel"
# To overcome, you can try nightly rust
rustup install nightly
cargo +nightly install racer
# then add source code
rustup component add rust-src
# -----------------------------------------------------------------------------------


# Ocaml & Coq (deprecated)
# Following links below:
# Ocaml: https://ocaml.org/docs/install.html
# Opam: https://opam.ocaml.org/doc/Install.html
pacman -S ocaml
pacman -S opam
# then coq: https://coq.inria.fr/opam/www/using.html
export OPAMROOT=~/.opam # installation directory
opam init -n --comp=4.02.3 -j 2 # 2 is the number of CPU cores (can be changed)
opam repo add coq-released http://coq.inria.fr/opam/released
opam install coq.8.8.1 && opam pin add coq 8.8.1
# to run coq, don't forget to add opam path to zshrc.
# check coq version
coqc -v
# current ocaml version (4.02.3) is just for coq,
# hence we also install a newer compiler version (e.g. 4.04.1)
opam switch create 4.04.1
eval $(opam env)
# Now install some useful packages
opam update
opam install core
opam install merlin
opam install utop
opam install tuareg
opam install ocp-indent
# Then, follow this link to set utop: https://dev.realworldocaml.org/install.html
# note: (1). use `opam switch 'version'` to change ocaml base compiler version.
#       (2). just use `opam switch` to check ocaml version list.
#       (3). use `opam switch remove 'version'` to wipe a version and all its packages.
#       (4). use `opam config var share` to check package path.
# ------------------------------------------------------------------------------------------------


# Julia installation
# First download the binary files from one of:
# 1). offical: https://julialang.org/downloads/ (may be very slow)
# 2). mirrors (e.g. USTC): http://mirrors.ustc.edu.cn/julia/
# then decompress the package to a path (up to you)
# and add your julia path to bashrc or zshrc PATH.
source ~/.zshrc
# check julia version
julia -version
# !!! another recommend method is just use pacman
sudo pacman -S julia
# --------------------------------------------------------------------------------