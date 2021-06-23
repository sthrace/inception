service mysql start
mysql -u root
mysql --execute="CREATE DATABASE wpdb; \
                GRANT ALL ON wordpress.* TO 'sthrace'@'127.0.0.1' IDENTIFIED BY 'password' WITH GRANT OPTION; \                FLUSH PRIVILEGES;"
