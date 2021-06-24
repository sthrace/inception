FROM 	debian:buster

RUN     apt-get -y update && apt-get -y upgrade php-fpm
RUN		apt-get -y install mariadb-server
# COPY  	./conf/	.
# RUN	chmod 777 ./mysql.sh
EXPOSE 	3306
CMD 		["/usr/sbin/mysql", "--nodaemonize"]
