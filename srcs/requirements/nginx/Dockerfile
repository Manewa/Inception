FROM "debian:bullseye"

RUN apt update && apt install -y nginx vim curl && \ 
	mkdir -p /etc/nginx/ssl && apt install openssl -y && \
	openssl req -x509 -nodes \
		-out /etc/nginx/ssl/inception.crt \
		-keyout /etc/nginx/ssl/inception.key \
		-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=namalier.42.fr/UID=namalier" && \
	mkdir -p /var/run/nginx && \
	chmod 755 /var/www/html && chown -R www-data:www-data /var/www/html

COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD [ "nginx", "-g", "daemon off;" ]
