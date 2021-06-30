if  [ ! -f /var/www/wordpress/wp-config.php ]; then 
    
    wp core --allow-root download --locale=en_US --force 
    sleep 5;
    while  [ ! -f /var/www/wordpress/wp-config.php ]; do   

        
        wp core config --allow-root --dbname=wp --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb:3306
        

    done 
    wp core install --allow-root --url='localhost' --title='School 21 Inception by sthrace' --admin_user=$MYSQL_LOGIN --admin_password=$MYSQL_PASS  --admin_email="sthrace@school21.fd" --path='/var/www/wordpress';
    # wp  user create --allow-root $WPU_1LOGIN user2@user.com --user_pass=$WPU_1PASS --role=author
    wp theme install --allow-root dark-mode --activate     
fi 
php-fpm7.3 --nodaemonize