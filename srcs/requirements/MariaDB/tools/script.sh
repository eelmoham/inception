#!/bin/bash

service mysql start

mysql -e "CREATE USER '$MYSQL_USER'@'$DOMAIN_NAME' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'$DOMAIN_NAME';"
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'" # Change root password
mysql -e "FLUSH PRIVILEGES;"

kill "cat /var/run/mysqld/mysqld.pid"

exec "$@"