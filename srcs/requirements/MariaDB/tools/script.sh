#!/bin/bash

# sed -i 's/bind-address.*/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf
# sed -i "s/#port*/port = 3306" /etc/mysql/mariadb.conf.d/50-server.cnf
service mysql start # Start mysql
mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME" # Create database
mysql -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PSSWRD'" # Create user #still not working

mysql -u root -p$MYSQL_ROOT_PASSWORD << EOF
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
ALTER USER 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
FLUSH PRIVILEGES;
EOF

kill `cat /var/run/mysqld/mysqld.pid` # Stop mysql

exec "$@" # Run CMD




# mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION;"
# mysql -e "FLUSH PRIVILEGES;"
# #!/bin/bash
# mysql -u root -p"$MYSQL_ROOT_PASSWORD" < /path/to/setup.sql
