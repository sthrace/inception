FROM	debian:buster

RUN     	apt-get -y update && apt-get -y upgrade
RUN			apt-get install -y wget php-fpm php-mysql php-mbstring
# RUN 		wget http://wordpress.org/latest.tar.gz && \
# 			tar -xzvf latest.tar.gz && rm -rf latest.tar.gz && \
# 			mv wordpress /var/www/html/
COPY 		./conf/wp-config.php /var/www/html/wordpress
RUN 		rm -rf /var/www/html/wordpress/wp-config-sample.php
COPY		./conf/		/var/www/html/
RUN 		chown -R $sthrace:$sthrace /var/www/html/*
RUN 		chmod -R 755 /var/www/html/*
EXPOSE 		9000
CMD 		[ "/usr/sbin/php-fpm7.3", "--nodaemonize"]
ENTRYPOINT 	["/var/www/html/wp.sh"]
