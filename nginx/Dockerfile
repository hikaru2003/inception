FROM debian:bullseye

RUN apt update
RUN apt install -y vim curl wget
RUN apt install -y nginx

ADD default /etc/nginx/sites-available/default

CMD ["nginx", "-g", "daemon off;"]