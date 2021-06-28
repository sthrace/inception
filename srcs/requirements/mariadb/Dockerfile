FROM 	debian:buster

RUN     apt-get -y update
RUN		apt-get -y install mariadb-server

COPY    ./conf/mysql.sh /mysql.sh
RUN     chown -R www-data:www-data /mysql.sh
RUN     chmod -R 777 /mysql.sh
EXPOSE 	3306
ENTRYPOINT [ "sh", "/mysql.sh" ]
