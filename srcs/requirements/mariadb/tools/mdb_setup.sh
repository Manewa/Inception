#!/bin/sh

set -e

if [ -z "$MYSQL_DB" ] || [ -z "$MYSQL_USER" ] || [ -z "$MYSQL_PASSWORD" ] || [ -z "$MYSQL_ROOT_PASSWORD" ]; then
	echo "Error: Missing environment variables"
	exit 1
fi

if [ ! -d "/var/lib/mysql/mysql" ]; then
	echo "Initializing mariadb"

	mkdir /var/lib/mysql
	mysqld_safe --datadir=/var/lib/mysql &

	until mariadb -e "SELECT 1;" > /dev/null 2>&1; do
		echo "Waiting for MariaDB..."
		sleep 1
	done

mariadb << EOF
CREATE DATABASE IF NOT EXISTS \`${MYSQL_DB}\`;
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${MYSQL_DB}\`.* TO '${MYSQL_USER}'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
FLUSH PRIVILEGES;
EOF

	mysqladmin shutdown

fi

echo "starting mariadb"
exec mysqld_safe --port=3306 --bind-address=0.0.0.0 --datadir=/var/lib/mysql
