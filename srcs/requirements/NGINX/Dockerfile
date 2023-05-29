FROM debian:buster

RUN apt-get update && apt-get install -y nginx openssl

RUN mkdir -p /etc/nginx/certs

COPY ./tools/script.sh .

RUN chmod +x ./script.sh

RUN ./script.sh

COPY ./conf/default.conf /etc/nginx/sites-enabled/default

CMD ["nginx", "-g", "daemon off;"]
