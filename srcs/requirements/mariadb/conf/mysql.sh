mysql_install_db
service mysql start
mysql -e "CREATE DATABASE IF NOT EXISTS wp;" &&\
mysql -e "CREATE USER '${MYSQL_USER}'@'sthrace.42.fr' identified by '${MYSQL_PASSWORD}';" &&\
mysql -e "GRANT ALL PRIVILEGES ON wp TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" &&\
mysql -e "FLUSH PRIVILEGES;"
service mysql restart