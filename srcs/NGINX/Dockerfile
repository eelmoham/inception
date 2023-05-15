FROM debian:buster-slim

RUN apt-get update && apt-get install -y nginx openssl && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/certs

COPY . .

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/certs/nginx-selfsigned.key -out /etc/nginx/certs/nginx-selfsigned.crt -subj "/C=US/ST=California/L=San Francisco/O=My Company/OU=DevOps/CN=mydomain.com"

CMD ["nginx", "-g", "daemon off;"]

