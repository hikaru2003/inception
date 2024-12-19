FROM debian:bullseye

RUN apt update
RUN apt install -y vim curl wget mariadb-server

ADD ./mariadb_init.sh ./mariadb_init.sh
RUN chmod +x ./mariadb_init.sh

# CMD ["mysqld"]
ENTRYPOINT ["./mariadb_init.sh"]