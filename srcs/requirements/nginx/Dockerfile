FROM    debian:buster

RUN     apt-get update && apt-get -y upgrade

RUN     apt-get install -y openssl nginx vim php-cgi php-fpm
COPY    ./conf/nginx.conf        /etc/nginx/sites-available/default
# RUN 	rm -rf /etc/nginx/sites-enabled/default
RUN     openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    	-subj "/C=ru/ST=Central/L=Moscow/O=CodingSchool/OU=6thWave/CN=sthrace/" \
    	-keyout /etc/ssl/sthrace.key \
    	-out /etc/ssl/sthrace.crt

COPY	./tools/start.sh		/var/www
RUN 	chown -R $sthrace:$sthrace /var/www/*
RUN 	chmod -R 755 /var/www/*

EXPOSE  443
CMD ["nginx", "-g", "daemon off;"]
