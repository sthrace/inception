service mysql start
mysql -u root
mysql --execute="CREATE DATABASE wpdb; \
                GRANT ALL ON wordpress.* TO 'sthrace'@'localhost' IDENTIFIED BY 'password' WITH GRANT OPTION; \                FLUSH PRIVILEGES;"
