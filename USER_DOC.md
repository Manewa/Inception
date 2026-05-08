**USER DOCUMENTATION**

**Overview**

This infrastructure provides:

A secure HTTPS website
A WordPress CMS
A MariaDB database

To start the project you have to make.

To stop the project : make down.

To restart the project : make restart (down up)


Access the website : https://namalier.42.fr

Access the admin board : https://namalier.42.fr/wp-admin

Credentials are stored in secrets.

To check is the seervice is running correctly, you can do "docker compose -f ./srcs/docker-compose.yml ps".

To check logs : make logs.

