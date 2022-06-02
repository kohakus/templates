# copy from https://wiki.archlinux.org/title/Pacman


# To list all packages no longer required as dependencies (orphans)
pacman -Qdt
# ----------------------------------------------------------------------


# To list all packages explicitly installed and not required as dependencies
pacman -Qet
# -----------------------------------------------------------------------------


# To view the dependency tree of a package
pactree $package_name
# -------------------------------------------


# Download a package without installing it
pacman -Sw $package_name
# ---------------------------------------------


# **Cleaning the package cache**
# Pacman stores its downloaded packages in /var/cache/pacman/pkg/ and does not remove the old or uninstalled versions automatically.
# This has some advantages:
# 1. It allows to downgrade a package without the need to retrieve the previous version through other means, such as the Arch Linux Archive.
# 2. A package that has been uninstalled can easily be reinstalled directly from the cache directory, not requiring a new download from the repository.
# However, it is necessary to deliberately clean up the cache periodically to prevent the directory to grow indefinitely in size.
#
# deletes all cached versions of installed and uninstalled packages, except for the most recent three, by default:
paccache -r
# You can also define how many recent versions you want to keep. To retain only one past version use:
paccache -rk1
# to remove all cached versions of uninstalled packages, use the following:
paccache -ruk0
# To remove all the cached packages that are not currently installed, and the unused sync database, execute:
pacman -Sc
# -------------------------------------------------------------------------------------------------------------------------------------------------------------