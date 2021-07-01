FROM alpine:3.12

RUN     apk update
RUN     apk add php7 php7-mysqli php7-fpm bash
RUN     mkdir -p /var/www/temp
ADD     https://wordpress.org/latest.tar.gz /var/www/temp
RUN     cd /var/www/temp && \
        tar -xzvf latest.tar.gz && rm -rf latest.tar.gz
COPY    conf/wp-config.php /var/www/temp/wordpress/
RUN     echo "listen = 9000" >> /etc/php7/php-fpm.d/www.conf
COPY    conf/wp.sh /
RUN     chmod +x /wp.sh
EXPOSE  9000
ENTRYPOINT [ "/wp.sh" ]