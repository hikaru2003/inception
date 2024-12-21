FROM debian:bullseye

RUN apt update -y && apt upgrade -y
RUN apt install -y vim curl wget mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/mariadb_init.sh /tmp/mariadb/mariadb_init.sh
RUN chmod +x tmp/mariadb/mariadb_init.sh

# EXPOSE 3306

ENTRYPOINT ["/tmp/mariadb/mariadb_init.sh"]