FROM alpine:3.12

ARG DB_NAME
ARG DB_USER
ARG DB_PASSWORD
ARG RT_PASS
RUN apk update
RUN apk add openrc mariadb mariadb-common mariadb-client
VOLUME  ["/sys/fs/cgroup"]
RUN     chmod 755 /etc/my.cnf
RUN     echo "[mysqld]" > /etc/my.cnf; \
        echo "user=root" >> /etc/my.cnf; \
        echo "port=3306" >> /etc/my.cnf; \
        echo "datadir=/var/lib/mysql" >> /etc/my.cnf; \
        echo "skip-networking=false" >> /etc/my.cnf; \
        echo "bind-address=0.0.0.0" >> /etc/my.cnf
RUN     openrc default && \
        /etc/init.d/mariadb setup && \
        rc-service mariadb start && \
        mysql -u root --password=$RT_PASS CREATE DATABASE IF NOT EXISTS $DB_NAME; \
        mysql -u root --password=$RT_PASS CREATE USER IF NOT EXISTS $DB_USER@'%' IDENTIFIED BY $DB_PASS; \
        mysql -u root --password=$RT_PASS GRANT ALL PRIVILEGES ON $DB_NAME TO $DB_USER$@'%' IDENTIFIED BY $DB_PASS;  \
        mysql -u root --password=$RT_PASS FLUSH PRIVILEGES; \
        rc-service mariadb stop
RUN     chown mysql:mysql /var/run/mysqld
EXPOSE 3306
CMD     [ "/usr/bin/mysqld_safe" ]
