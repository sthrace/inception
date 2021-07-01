FROM alpine:3.12

RUN     apk update
RUN     apk add php7 php7-mysqli php7-fpm bash
RUN     mkdir -p /var/www/temp
ADD     https://wordpress.org/latest.tar.gz /var/www/temp
RUN     cd /var/www/temp && \
        tar -xzvf latest.tar.gz && rm -rf latest.tar.gz
COPY    conf/wp-config.php /var/www/temp/wordpress/
RUN     mkdir -p /var/www/wordpress && \
        mv /var/www/temp/wordpress/* /var/www/wordpress/ && \
        rm -rf /var/www/temp && \
        echo "listen = 9000" >> /etc/php7/php-fpm.d/www.conf
EXPOSE  9000
ENTRYPOINT [ "php-fpm7" ]
CMD     [ "-F" ]