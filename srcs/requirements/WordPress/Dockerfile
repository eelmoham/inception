FROM debian:buster

RUN apt-get update && apt-get install -y php7.3 php-fpm php7.3-mysql wget

COPY ./tools/script.sh /var/www/script.sh

RUN chmod +x /var/www/script.sh

EXPOSE 9000

ENTRYPOINT [ "./var/www/script.sh" ]

CMD ["php-fpm7.3", "-F"]