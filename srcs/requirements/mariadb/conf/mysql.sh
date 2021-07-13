mkdir -p /var/lib/mysql
chmod 777 /var/lib/*

mysqld -u root & sleep 5

echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DB;" | mysql -u root
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%' WITH GRANT OPTION;" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

