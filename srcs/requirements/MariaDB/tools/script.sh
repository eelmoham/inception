#!/bin/bash

sed -i 's/bind-address.*/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

service mysql start # Start mysql
mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME" # Create database
mysql -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PSSWRD'" # Create user #still not working
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%'" # Grant privileges
mysql -e "FLUSH PRIVILEGES"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'"# Change root password
mysql -e "FLUSH PRIVILEGES"
kill `cat /var/run/mysqld/mysqld.pid` # Stop mysql