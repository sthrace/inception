openrc default
/etc/init.d/mariadb setup
rc-service mariadb start

mysql -e "CREATE DATABASE IF NOT EXISTS wp;"
mysql -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'sthrace.42.fr' identified by '${MYSQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON wp TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"

rc-service mariadb stop
/usr/bin/mysqld_safe