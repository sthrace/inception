FROM	debian:buster

RUN     	apt-get update
RUN			apt-get install -y wget php7.3-common php7.3-fpm php7.3-mysql php7.3-mbstring php7.3-gd php7.3-cli php7.3-xml
RUN         mkdir -p /var/www/html
RUN         wget http://wordpress.org/latest.tar.gz && \
            tar -xzvf latest.tar.gz && rm -rf latest.tar.gz && \
            mv wordpress /var/www/html/
RUN 		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN			chmod +x wp-cli.phar
RUN 		mv wp-cli.phar /usr/local/bin/wp

RUN 		echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf
RUN 		echo "access.log = /var/log/$pool.access.log" >> /etc/php/7.3/fpm/pool.d/www.conf
RUN 		mkdir -p /var/www/wordpress
RUN 		chown -R www-data:www-data /var/www/wordpress/
RUN 		chmod 777 /var/www/wordpress/
RUN 		mkdir -p /run/php/
COPY		conf/wp.sh /var/www/wordpress
RUN 		chown -R www-data:www-data /var/www/wordpress/
RUN 		chmod 777 /var/www/wordpress/
EXPOSE 		9000
RUN 		touch /run/php/php7.3-fpm.pid
ENTRYPOINT  ["sh", "/var/www/wordpress/wp.sh"]