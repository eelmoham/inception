#!/bin/bash

mkdir -p /run/php
touch /run/php/php7.3-fpm.pid
sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf"
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/local/bin/wp
chmod +x /usr/local/bin/wp

if [ ! -f /usr/share/nginx/html/index.php ]; then
    mkdir -p ç
    cd /var/www/html && wp core download --allow-root
    touch /var/www/html/wp-config.php
    sed -i "s/database_name_here/$DB_NAME/g" /var/www/html/wp-config-sample.php
    sed -i "s/username_here/$MYSQL_USER/g" /var/www/html/wp-config-sample.php
    sed -i "s/password_here/$MYSQL_PASSWORD/g" /var/www/html/wp-config-sample.php
    sed -i "s/localhost/$DB_HOST/g" /var/www/html/wp-config-sample.php
    cd /var/www/html
    cp wp-config-sample.php wp-config.php
    wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PSSWRD --admin_email=$WP_ADMIN_EMAIL --allow-root
    wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PSSWRD --allow-root
    echo "Downloading and configuring WordPress..."
else
    echo "WordPress already installed"
fi

exec "$@"