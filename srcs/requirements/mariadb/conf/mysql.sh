mkdir -p /var/lib/mysql
chmod 777 /var/lib/*

mysql -u root

echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DB;" | musql -u root -e
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql -u root -e
echo "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%' WITH GRANT OPTION;" | mysql -u root -e
echo "FLUSH PRIVILEGES;" | mysql -u root -e