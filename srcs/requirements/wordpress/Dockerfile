FROM alpine:3.12

RUN     apk update
RUN     apk add php7 php7-mysqli php7-fpm php7-gd php7-mbstring php7-common php7-json bash 
RUN     mkdir -p /var/www/wordpress
ADD     https://wordpress.org/latest.tar.gz .
RUN     tar -xzvf latest.tar.gz && rm -rf latest.tar.gz && \
        mv /wordpress/* /var/www/wordpress/ && \
        rm -rf /wordpress
COPY    conf/wp-config.php /var/www/wordpress/
RUN     chmod 777 /etc/php7/php-fpm.d/www.conf && \
        echo "listen = wordpress:9000" >> /etc/php7/php-fpm.d/www.conf && \
        echo "clear_env = no" >> /etc/php7/php-fpm.d/www.conf
EXPOSE  9000
ENTRYPOINT [ "php-fpm7" ]
CMD     [ "-F" ]