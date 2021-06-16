FROM 	debian:buster

RUN     apt-get -y update && apt-get -y upgrade
RUN		apt-get -y install mariadb-server
COPY  	./conf/	.
EXPOSE 	3306
RUN 	bash mysql.sh