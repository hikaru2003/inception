FROM debian:bullseye

RUN apt update
RUN apt install -y vim curl wget
RUN apt install -y mariadb-server

# CMD ["mysqld"]
ENTRYPOINT ["/bin/sh", "-c", "while :; do sleep 10; done"]