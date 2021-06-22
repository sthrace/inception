FROM	debian:buster

RUN     	apt-get update && apt-get -y upgrade
RUN			apt-get install -y wget tar php-fpm php-mysql php-mbstring php-cgi
RUN 		wget http://wordpress.org/latest.tar.gz && \
			tar -xzvf latest.tar.gz && rm -rf latest.tar.gz && \
			mkdir var/www && mkdir var/www/html && mv wordpress /var/www/html/
COPY 		./conf/wp-config.php /var/www/html/wordpress
RUN 		rm -rf /var/www/html/wordpress/wp-config-sample.php
RUN			sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf"
RUN 		mkdir -p /run/php/
RUN 		touch /run/php/php7.3-fpm.pid
EXPOSE 		9000
CMD 		[ "/usr/sbin/php-fpm7.3", "--nodaemonize"]
