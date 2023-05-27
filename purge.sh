#!/bin/bash
docker rm mariadb wordpress nginx -f
docker rmi $(docker images -aq) -f
docker volume prune -f
docker network prune -f
docker system prune -f 