#!/bin/bash

cd /var/www/html
if [ ! -f /var/www/html/index.php ]; then
    wp core download --allow-root
else
    echo "WordPress already installed"
fi

if [ ! -f /var/www/html/wp-config.php ]; then
    wp config create --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbhost=$WORDPRESS_DB_HOST --allow-root
else
    echo "wp-config.php already exists. Skipping config creation."
fi

if ! wp core is-installed --allow-root; then
    wp core install --url=$WORDPRESS_URL --title=$WORDPRESS_TITLE --admin_user=$WORDPRESS_ADMIN_USER --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=$WORDPRESS_ADMIN_EMAIL --allow-root
    wp user create --url=$WORDPRESS_URL $WORDPRESS_USER_NAME $WORDPRESS_USER_EMAIL --user_pass=$WORDPRESS_USER_PASSWORD --role=$WORDPRESS_USER_ROLE --allow-root

else
    echo "WordPress is already installed. Skipping installation."
fi

exec php-fpm7.4 -F
