# Makefile

# Define the default target
.DEFAULT_GOAL := help

# Variables
COMPOSE_FILE := ./srcs/docker-compose.yml

# Targets
.PHONY: up down restart help

up:  ## Start the containers
	docker-compose -f $(COMPOSE_FILE) up -d

down:  ## Stop and remove the containers
	docker-compose -f $(COMPOSE_FILE) down

restart: down up  ## Restart the containers

purge:
	docker rm $(docker ps -aq) -f
	docker rmi $(docker images -aq) -f
	docker volume prune -f
	docker network prune -f
	docker system prune -f 