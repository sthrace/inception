cp -rf /var/www/temp/wordpress/* /var/www/wordpress/
rm -rf /var/www/temp

php-fpm7 --nodaemonize