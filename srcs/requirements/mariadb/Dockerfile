FROM debian:buster

RUN apt-get update
RUN apt-get install -y apt-utils mariadb-server

COPY    conf/mysql.sh .
RUN     chmod +x mysql.sh

EXPOSE 3306
ENTRYPOINT [ "sh", "/mysql.sh" ]


# FROM 	alpine:3.10

# RUN     apk update
# RUN		apk add mariadb mariadb-client openrc --no-cache

# COPY    ./conf/mysql.sh /mysql.sh
# RUN     chown mysql:mysql /usr/bin/mysqld
# RUN     chown xfs:xfs /var/lib/mysql
# RUN     chmod 777 /tmp/
# RUN     chmod +t /tmp/
# RUN     chown root:root /tmp/
# RUN     chmod -R 777 /mysql.sh
# EXPOSE 	3306
# ENTRYPOINT [ "sh", "/mysql.sh" ]
