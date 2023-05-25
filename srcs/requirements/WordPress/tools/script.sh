#!/bin/bash

apt-get clean
mkdir -p /run/php
sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf"
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/local/bin/wp
chmod +x /usr/local/bin/wp
mkdir -p /var/www/html #create shared directory for WordPress if it doesn't exist
cd /var/www/html
wp core download --allow-root #download the WordPress core files into the current directory
cd /var/www/html
#touch wp-config.php #create wp-config.php file
wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PSSWRD --dbhost=$DB_HOST --allow-root
wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PSSWRD --admin_email=$WP_ADMIN_EMAIL --allow-root
wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PSSWRD --allow-root
#cp wp-config-sample.php wp-config.php
exec "$@"