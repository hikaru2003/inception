FROM debian:bullseye

RUN apt update
RUN apt install -y vim curl wget
RUN apt install -y mariadb-server

ADD ./init.sh ./init.sh
RUN chmod +x ./init.sh

# CMD ["mysqld"]
ENTRYPOINT ["./init.sh"]