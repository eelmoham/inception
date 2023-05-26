#!/bin/bash

# sed -i 's/bind-address.*/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf
# sed -i "s/#port*/port = 3306" /etc/mysql/mariadb.conf.d/50-server.cnf

service mysql start # Start mysql
mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME" # Create database
mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'" # Create user #still not working
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%' WITH GRANT OPTION"

mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
mysql -e "ALTER USER 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
mysql -e "FLUSH PRIVILEGES;"



# mysql -uroot -p$MYSQL_ROOT_PASSWORD << EOF
# GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
# GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
# ALTER USER 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
# FLUSH PRIVILEGES;
# EOF

kill `cat /var/run/mysqld/mysqld.pid`


sed -i '/^\[mysqld\]/a skip-grant-tables' /etc/mysql/mariadb.conf.d/50-server.cnf

exec "$@"