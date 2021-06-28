FROM    debian:buster

RUN     apt-get update

RUN     apt-get install -y openssl nginx vim php-fpm
RUN		rm /etc/nginx/sites-available/default
RUN		rm /etc/nginx/sites-enabled/default
COPY    conf/nginx.conf        /etc/nginx/sites-available/default
RUN 	ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

RUN     openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    	-subj "/C=ru/ST=Central/L=Moscow/O=CodingSchool/OU=6thWave/CN=sthrace/" \
    	-keyout /etc/ssl/sthrace.key \
    	-out /etc/ssl/sthrace.crt

RUN 	chown -R www-data:www-data /var/www/
RUN 	chmod -R 755 /var/www/
RUN 	chmod -R 777 /etc/ssl/*

EXPOSE  443
CMD ["nginx", "-g", "daemon off;"]
