#!/bin/sh

set -e

sleep 10

cd /var/www/wordpress

if [ ! -f wp-config.php ]; then
    echo "Creating wp-config.php"

    wp config create \
        --dbname="$MYSQL_DB" \
        --dbuser="$MYSQL_USER" \
        --dbpass="$MYSQL_PASSWORD" \
        --dbhost="mariadb:3306" \
        --path='/var/www/wordpress' --allow-root
fi


#Install wordpress title/admin username/pass/mail
if ! wp core is-installed --allow-root --path='/var/www/wordpress'; then
	echo "Installing wordpress"
	wp core install --url="$DOMAIN_NAME" \
			--title="$WP_TITLE" \
			--admin_user="$WP_ADMIN_N" \
			--admin_password="$WP_ADMIN_P" \
			--admin_email="$WP_ADMIN_E" \
			--allow-root \
			--path='/var/www/wordpress' --skip-email \
fi

#Create User
if wp user get "$WP_U_NAME" --allow-root --path='/var/www/wordpress' >/dev/null; then
    echo "User exists"
else
	echo "Creating User"
	wp user create "$WP_U_NAME" "$WP_U_EMAIL"
	--user_pass="$WP_U_PASS"
	--role="$WP_U_ROLE"
	--allow-root
	--path='/var/www/wordpress'
	echo "Created User"
fi

#Create a dir for php fpm and start service in foreground
mkdir -p /run/php
exec /usr/sbin/php-fpm7.4 -F
