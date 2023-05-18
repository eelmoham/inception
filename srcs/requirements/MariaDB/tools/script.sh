#!/bin/bash

service mysql start
mysql -e "CREATE DATABASE wordpress;"
mysql -e "CREATE USER 'eelmoham'@'localhost' IDENTIFIED BY 'Mehdi@zero';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'eelmoham'@'localhost';"
mysql -e "FLUSH PRIVILEGES;"
exec "$@"