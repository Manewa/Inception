**DEVELOPPER DOCUMENTATION**

**Prerequisites**

Packages required :
- docker.io
- docker-compose
- make

Secrets need to have a file for each password required in .env with the pass inside.

To build and laune the project, you just have to make. It will automatically create the required directors and run docker compose.

*docker ps* to show containers
*make logs* to see logs
*make stop* to stop containers
*make down* to remove containers
*make fclean* to full cleanup

Data are stored in /home/namalier/data/mariadb and /home/namalier/data/wordpress.
They are mounted into containers using bind mounts.