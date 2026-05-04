FROM debian:bullseye

RUN apt update && apt install -y wget \
	php7.4 \
	php-fpm \
	php-mysql \
	mariadb-client 

RUN	wget https://fr.wordpress.org/wordpress-6.9.4-fr_FR.tar.gz -P /var/www && \
	cd /var/www && tar -xzf wordpress-6.9.4-fr_FR.tar.gz && rm wordpress-6.9.4-fr_FR.tar.gz && \
	chown -R root:root /var/www/wordpress && \
	sed -i 's|^listen = .*|listen = 0.0.0.0:9000|' /etc/php/7.4/fpm/pool.d/www.conf && \
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/auto_config.sh ./auto_config.sh

RUN	chmod +x auto_config.sh

ENTRYPOINT ["./auto_config.sh"]
