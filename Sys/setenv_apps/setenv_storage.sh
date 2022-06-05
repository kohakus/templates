# MySQL (MariaDB)
sudo pacman -S mariadb
mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
systemctl start mysqld.service
mysql_secure_installation
systemctl enable mysqld
mysql -uroot -p
# --------------------------------------------------------------------------------------------


# Redis
# option (a). via pacman
sudo pacman -S redis
sudo systemctl start redis
# The Redis configuration file is well-documented and located at /etc/redis/redis.conf
# Check binary files by using `where redis-server`
#
# option (b). build from source
# 1. download source files from https://redis.io/download/
wget https://github.com/redis/redis/archive/7.0.0.tar.gz # redis7.0 as an exampe
tar -zxvf 7.0.0.tar.gz
# 2. mv redis source dir as /usr/local/redis and install
cd redis/
make
make PREFIX=/usr/local/redis install # we usually use the same dir as install dst
# then all the redis files are located at /usr/local/redis, to delete redis, use `rm -rf /usr/local/redis`
# -------------------------------------------------------------------------------------------------------------