FROM alpine:3.12

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
COPY	conf/mysql.sh   /
RUN     chmod 777 /mysql.sh
RUN     mkdir -p /var/run/mysqld
RUN     chown mysql:mysql /var/run/mysqld
EXPOSE 3306
ENTRYPOINT [ "sh", "/mysql.sh" ]
