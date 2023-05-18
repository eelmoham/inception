FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server

COPY ./conf/my.cnf /etc/mysql/my.cnf

COPY ./tools/script.sh .

RUN chmod +x ./script.sh

EXPOSE 3306

ENTRYPOINT [ "./script.sh" ]

CMD ["mysqld_safe"]