**USER DOCUMENTATION**

**Overview**

This infrastructure provides:

A secure HTTPS website
A WordPress CMS
A MariaDB database

At first, you have to create passwords in secrets :

mkdir secrets
touch secrets/db_pass.txt
touch secrets/db_root_pass.txt
touch secrets/wp_admin_pass.txt
touch secrets/wp_user_pass.txt
echo "user_pass" > secrets/db_pass.txt
echo "root_pass" > secrets/db_root_pass.txt
echo "admin_pass" > secrets/wp_admin_pass.txt
echo "wp_pass" > secrets/wp_user_pass.txt

To start the project you have to make.

To stop the project : make down.

To restart the project : make restart (down up)


Access the website : https://namalier.42.fr

Access the admin board : https://namalier.42.fr/wp-admin

Credentials are stored in secrets.

To check is the seervice is running correctly, you can do "docker compose -f ./srcs/docker-compose.yml ps".

To check logs : make logs.

