FROM debian:buster

RUN apt-get update && apt-get install -y php-fpm php-mysql wget

COPY ./tools/script.sh .

RUN chmod +x ./script.sh

EXPOSE 9000

ENTRYPOINT [ "./script.sh" ]

CMD ["php-fpm7.3", "-F"]