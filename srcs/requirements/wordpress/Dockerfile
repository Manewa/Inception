FROM debian:bullseye

RUN apt update && apt upgrade && apt install -y widget && \
	apt install -y php7.3 && \
	apt install -y pfp-FPM && \
	apt install -y php-mysql && \
	apt install -y mariadb-client && \
	wget https://fr.wordpress.org/wordpress-6.9.4-fr_FR.tar.gz -P /var/www && \
	cd /var/ww && tar -xzf wordpress-6.9.4-fr_FR.tar.gz && rm wordpress-6.9.4-fr_FR.tar.gz && \
	chmod -R root:root /var/www/wordpress && \
	sed -i 's|^listen = .*|listen = 0.0.0.0:9000|' /etc/php/8.2/fpm/pool.d/www.conf && \
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
	
