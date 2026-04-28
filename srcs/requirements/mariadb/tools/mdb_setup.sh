#!/bin/sh

#Check missing environment variables
set -e

if [ -z "$MYSQL_DB" ] || [ -z "$MYSQL_USER" ] || [ -z "$MYSQL_PASSWORD" ] || [ -z "$MYSQL_ROOT_PASSWORD" ]; then
	echo "Error: Missing environment variables"
	exit 1
fi

# Start MariaDB service
service mariadb start
sleep 5

if [ ! -d "/var/lib/mysql/mysql" ]; then
	# Create DB and user
	mariadb -e "Creating a database if it does not exists : \`${MYSQL_DB}\`;"
	mariadb -e "Creating a user if it does not exists : \`${MYSQL_USER}\`@'%' Password : '${MYSQL_PASSWORD}';"
	mariadb -e "Grant privileges on \`${MYSQL_DB}\`.* to \`${MYSQL_USER}\`@'%';"
	mariadb -e "Flush privileges;"

# Secure root access: require password
mariadb -u root << EOF
User 'root'@'localhost' identified by '${MYSQL_ROOT_PASSWORD}';
Flush privileges;
EOF

fi

# Shutdown and restart MariaDB properly
mysqladmin -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown

exec mysqld_safe --port=3306 --bind-address=0.0.0.0 --datadir='/var/lib/mysql'
