FROM debian:buster-slim

RUN apt-get update && apt-get install -y nginx openssl

RUN mkdir -p /etc/nginx/certs

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/certs/nginx-selfsigned.key -out /etc/nginx/certs/nginx-selfsigned.crt -subj "/C=US/ST=California/L=San Francisco/O=My Company/OU=DevOps/CN=localhost"

CMD ["nginx", "-g", "daemon off;"]
