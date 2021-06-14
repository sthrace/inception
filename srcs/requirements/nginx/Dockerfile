FROM	debian:buster

RUN		apt-get update
RUN		apt -y install wget openssl nginx

RUN 	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    	-subj "/C=ru/ST=Central/L=Moscow/O=CodingSchool/OU=6thWave/CN=sthrace/" \
    	-keyout /etc/ssl/sthrace.key \
    	-out /etc/ssl/sthrace.crt