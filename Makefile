.DEFAULT_GOAL := help

COMPOSE_FILE := ./srcs/docker-compose.yml

up:
	docker-compose -f $(COMPOSE_FILE) up -d

down:
	docker-compose -f $(COMPOSE_FILE) down

restart: down up

purge:
	docker rm nginx mariadb wordpress -f
	docker rmi srcs-nginx srcs-mariadb srcs-wordpress -f
	docker volume prune -f
	docker network prune -f
	docker system prune -f

.PHONY: up down restart