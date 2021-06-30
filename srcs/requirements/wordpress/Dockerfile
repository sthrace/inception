FROM debian:buster

RUN     apt-get update
RUN     apt-get install -y wget php7.3 php7.3-mysql php7.3-fpm


# RUN     wget https://wordpress.org/latest.tar.gz && \
#         tar -xzvf latest.tar.gz && rm -rf latest.tar.gz && \
#         mv wordpress/ /var/www/
# RUN     wget https://wordpress.org/latest.tar.gz
RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN	chmod +x wp-cli.phar
RUN	mv wp-cli.phar /usr/local/bin/wp 
RUN     echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf
RUN     mkdir -p var/www/wordpress
RUN     chown -R www-data:www-data var/www/wordpress/
RUN     chmod -R 777 /var/www/wordpress
# RUN     mv latest.tar.gz /var/www/latest.tar.gz
# RUN     tar -xzvf /var/www/latest.tar.gz && rm /var/www/latest.tar.gz
# COPY    conf/wp-config.php /var/www/wp-config.php
RUN     mkdir -p /run/php/

ENTRYPOINT [ "php-fpm7.3", "--nodaemonize" ]

# FROM	alpine:3.12

# RUN     apk update

# RUN     apk add bash wget curl php php-mysqli php-fpm php-common php-cli php-phar php-json

# RUN     mkdir -p /var/www/html
# RUN     wget http://wordpress.org/latest.tar.gz && \
#         tar -xzvf latest.tar.gz && rm -rf latest.tar.gz && \
#         mv wordpress /var/www/html/
# COPY    conf/wp-config.php /var/www/html/wordpress/wp-config.php
# RUN     mkdir -p /run/php
# COPY    conf/wp.sh .
# RUN     chmod 777 /wp.sh
# RUN     chmod -R 777 /var/www/html/wordpress/
# EXPOSE  9000
# RUN         echo "listen = 9000" >> /etc/php7/php-fpm.d/www.conf
# RUN         echo "access.log = /var/log/$pool.access.log" >> /etc/php7/php-fpm.d/www.conf
# CMD     [ "sh", "/wp.sh" ]