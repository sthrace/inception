sleep 10;
if [ ! -f /var/www/wordpress/wp-config.php ]; then
    wp core --allow-root download --locale=en_US --force
    sleep 10;
    while [ ! -f /var/www/wordpress/wp-config.php ]; do
        wp core config --allow-root --dbname=wp --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb:3306
    done
    wp core install --allow-root --url='sthrace.42.fr' --title='School 21 Inception project' --admin_user=$WORDPRESS_DB_USER --admin_password=$WORDPRESS_DB_PASSWORD --admin_email=$WORDPRESS_EMAIL --path='/var/www/wordpress';
fi
php-fpm7.3 --nodaemonize