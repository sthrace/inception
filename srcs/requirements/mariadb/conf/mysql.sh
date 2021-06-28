if [ ! -d "/var/lib/mysql/wordpress" ]; then
    mysql_install_db
    service mysql start

    mysql -e "CREATE USER '${MYSQL_USER}'@'sthrace.42.fr' identified by '${MYSQL_PASSWORD}';" &&\
    mysql -e "CREATE DATABASE IF NOT EXISTS wordpress;" &&\
    mysql -e "GRANT ALL PRIVILEGES ON wordpress TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" &&\
    mysql -e "FLUSH PRIVILEGES;"
    service mysql stop
fi
mysqld

