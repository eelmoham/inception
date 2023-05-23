#!/bin/bash
##################################################
DOMAIN_NAME=localhost    #eelmoham.42.fr        #
## certificates                                 #
# CERTS_=./XXXXXXXXXXXX                         #
## MYSQL SETUP                                  #
MYSQL_ROOT_PASSWORD=Mehdi@zero                  #
MYSQL_USER=eelmoham                             #
MYSQL_PASSWORD=Mehdi@zero                       #
#################################################
service mysql start # Start mysql

mysql -e "CREATE USER '$MYSQL_USER'@'$DOMAIN_NAME' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" # Create user #still not working
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'$DOMAIN_NAME';" # Grant privileges
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'" # Change root password
mysql -e "FLUSH PRIVILEGES;"

kill $(cat /var/run/mysqld/mysqld.pid) # Stop mysql