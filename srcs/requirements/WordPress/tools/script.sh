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


# exec "$@"
