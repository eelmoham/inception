#!/bin/bash

DB_NAME="xxxx"
DB_PSSWRD="xxxx"
DB_USER="xxxx"
DB_HOST="mariadb"

WP_URL="localhost"
WP_TITLE="website title"
WP_ADMIN="admin"
WP_ADMIN_PSSWRD="admin"
WP_ADMIN_EMAIL="admin@alaoui.com"
WP_USER="user"
WP_USER_PSSWRD="user"
WP_USER_EMAIL="user@eelmoham.com"


apt-get clean
mkdir -p /run/php
mkdir -p /var/www/html
sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf"
wget -qO- https://wordpress.org/latest.tar.gz | tar -xz -C /var/www/html
chmod +x /usr/local/bin/wp
mkdir -p /usr/share/nginx/html
cd /usr/share/nginx/html && wp core download --allow-root #download the WordPress core files into the current directory
touch /usr/share/nginx/html/wp-config.php
sed -i "s/database_name_here/$DB_NAME/g" /usr/share/nginx/html/wp-config-sample.php
sed -i "s/username_here/$DB_USER/g" /usr/share/nginx/html/wp-config-sample.php
sed -i "s/password_here/$DB_PSSWRD/g" /usr/share/nginx/html/wp-config-sample.php
sed -i "s/localhost/$DB_HOST/g" /usr/share/nginx/html/wp-config-sample.php
cd /usr/share/nginx/html/
cp wp-config-sample.php wp-config.php
wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PSSWRD --admin_email=$WP_ADMIN_EMAIL --allow-root
wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PSSWRD --allow-root

