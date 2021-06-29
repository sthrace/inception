FROM	alpine:3.12

RUN     apk update

RUN     apk add bash wget curl php php-fpm php-common php-cli php-phar php-json
RUN 	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN 	chmod +x wp-cli.phar
RUN 	mv wp-cli.phar /usr/local/bin/wp
RUN     mkdir -p /run/php
COPY    conf/wp.sh .
RUN     chmod 777 /wp.sh
RUN     mkdir -p /var/www/html/wordpress
RUN     chmod -R 777 /var/www/html/wordpress/
EXPOSE  9000
RUN         echo "listen = 9000" >> /etc/php7/php-fpm.d/www.conf
RUN         echo "access.log = /var/log/$pool.access.log" >> /etc/php7/php-fpm.d/www.conf
ENTRYPOINT [ "bash", "/wp.sh" ]