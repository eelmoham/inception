# Makefile

# Build the Docker image
docker-build:
	docker build -t nodeapp .

# Run the Docker container
docker-run:
	docker run --name my-node-app -p 8080:8080 -v $(pwd)/src:/app/src:ro -d nodeapp

clean :
	docker rm my-node-app -f
