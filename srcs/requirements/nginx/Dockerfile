FROM debian:bullseye

RUN apt update -y && apt upgrade -y
RUN apt install -y nginx openssl curl procps vim

COPY ./conf/default.conf /etc/nginx/sites-available/default

# TODO : SSL for https??
# COPY ./conf/default.conf /etc/nginx/conf.d/default.conf
# RUN mkdir -p /etc/nginx/ssl/certs && \
# 	mkdir -p /etc/nginx/ssl/private

# RUN openssl genrsa -out /etc/nginx/ssl/private/inception.key 2048 && \
# 	openssl req -new -key /etc/nginx/ssl/private/inception.key -out /etc/nginx/ssl/certs/inception.csr -subj "/C=JP/ST=Tokyo/L=Minato-ku/O=42Tokyo/OU=42cursus/CN=ryhara.42.fr" && \
# 	openssl x509 -req -days 365 -signkey /etc/nginx/ssl/private/inception.key -in /etc/nginx/ssl/certs/inception.csr -out /etc/nginx/ssl/certs/inception.crt

# RUN chown -R www-data:www-data /var/www/html && \
# 	chmod -R 755 /var/www/html
# EXPOSE 443


COPY ./tools/nginx_init.sh /nginx_init.sh
RUN chmod +x /nginx_init.sh
ENTRYPOINT [ "/nginx_init.sh" ]

# ENTRYPOINT ["nginx", "-g", "daemon off;"]
# ENTRYPOINT [ "/bin/bash", "-c", "while :; do sleep 10; done" ]