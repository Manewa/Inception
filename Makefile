NAME = inception

SRC = ./srcs/docker-compose.yml

DATA_DIR = /home/namalier/data
DB_DIR = $(DATA_DIR)/mariadb
WP_DIR = $(DATA_DIR)/wordpress

all: up

up:
	mkdir -p $(DB_DIR)
	mkdir -p $(WP_DIR)
	docker compose -f $(SRC) up -d --build

down:
	docker compose -f $(SRC) down

stop:
	docker compose -f $(SRC) stop

start:
	docker compose -f $(SRC) start

restart: down up

logs:
	docker compose -f $(SRC) logs

ps:
	docker compose -f $(SRC) ps

clean:
	docker compose -f $(SRC) down

fclean:
	docker compose -f $(SRC) down -v --rmi all
	sudo rm -rf $(DATA_DIR)

re: fclean all

.PHONY: all up down stop start restart logs ps clean fclean re
