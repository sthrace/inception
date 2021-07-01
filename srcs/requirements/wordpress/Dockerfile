FROM debian:buster

RUN     apt-get update
RUN     apt-get install -y apt-utils wget php7.3 php7.3-mysql php7.3-fpm

RUN     wget https://wordpress.org/latest.tar.gz && \
        tar -xzvf latest.tar.gz && rm -rf latest.tar.gz && \
        mkdir -p /var/www/html && \
        chown -R www-data:www-data /var/www/html/ && chmod -R 777 /var/www/html/ && \
        mv wordpress/* /var/www/html/ && rm -r wordpress

RUN     echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf
COPY    conf/wp-config.php /var/www/html/wp-config.php
RUN     mkdir -p /run/php/

EXPOSE 9000

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
# RUN         echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf
# RUN         echo "access.log = /var/log/$pool.access.log" >> /etc/php7/php-fpm.d/www.conf
# CMD     [ "sh", "/wp.sh" ]