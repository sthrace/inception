mkdir -p /var/lib/mysql
chmod 777 /var/lib/*

mariadb-install-db -u root

mysqld -u root & sleep 5

mysql -u root -e "CREATE DATABASE IF NOT EXISTS $SQL_DB;"
mysql -u root -e "CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PWD';"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO '$SQL_USER'@'%' WITH GRANT OPTION;"
mysql -u root -e "FLUSH PRIVILEGES;"
mysql -u root wp < wp.sql
mysql -u root -e "ALTER USER '$SQL_ROOT'@'localhost' IDENTIFIED BY '$SQL_ROOT_PWD';"

