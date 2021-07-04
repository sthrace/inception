# openrc default
# /etc/init.d/mariadb setup
# rc-service mariadb start

# mysql -u root --password='$MYSQL_ROOT_PASSWORD' -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DB;"
# mysql -u root --password='$MYSQL_ROOT_PASSWORD' -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
# mysql -u root --password='$MYSQL_ROOT_PASSWORD' -e "GRANT ALL PRIVILEGES ON $MYSQL_DB.* TO '$MYSQL_USER$'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
# mysql -u root --password='$MYSQL_ROOT_PASSWORD' -e "FLUSH PRIVILEGES;"
# mysql -u root --password='$MYSQL_ROOT_PASSWORD' -e "SHOW GRANTS FOR 'root'@'localhost';"
# # mysql -u root --password='$MYSQL_ROOT_PASSWORD' -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
# rc-service mariadb stop

# /usr/bin/mysqld_safe
#  --datadir='var/lib/mysql'

# openrc default
# /etc/init.d/mariadb setup
# rc-service mariadb start


# mysql -u root --password='$MYSQL_ROOT_PASSWORD' -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DB;"
# mysql -u root --password='$MYSQL_ROOT_PASSWORD' -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
# mysql -u root --password='$MYSQL_ROOT_PASSWORD' -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';"
# mysql -u root --password='$MYSQL_ROOT_PASSWORD' -e "GRANT ALL PRIVILEGES ON $MYSQL_DB.* TO '$MYSQL_USER'@'%';"
# mysql -u root --password='$MYSQL_ROOT_PASSWORD' -e "GRANT ALL PRIVILEGES ON $MYSQL_DB.* TO '$MYSQL_USER'@'localhost';"
# mysql -u root --password='$MYSQL_ROOT_PASSWORD' -e "FLUSH PRIVILEGES;"

# mysql -u root --password=rootpass -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"

# rc-service mariadb stop
# /usr/bin/mysqld_safe

mkdir -p /var/lib/mysql
chmod 777 /var/lib/*

mysql_install_db --user=mysql --datadir=/var/lib/mysql

mkdir -p /run/openrc/
touch /run/openrc/softlevel
openrc sysinit
service mariadb start

echo "CREATE DATABASE wordpress;" | mysql -u root
echo "CREATE USER 'root'@'%' IDENTIFIED BY 'root';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

service mariadb stop
chown -R mysql:mysql /var/lib/mysql
chmod 777 /var/lib/*
service mariadb start
pkill mysqld
mysqld --user=root --datadir=/var/lib/mysql