FROM debian:bullseye

RUN apt update
RUN apt install -y vim curl wget unzip
RUN apt install -y php7.4-fpm php7.4-mysql php7.4-gd php7.4-curl php7.4-xml php7.4-mbstring php7.4-zip

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod 755 wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p var/www/html

RUN mkdir -p /run/php \
    && touch /run/php/php7.4-fpm.pid \
    && chmod 755 /run/php/php7.4-fpm.pid

ADD www.conf /etc/php/7.4/fpm/pool.d/www.conf
ADD ./init.sh ./init.sh
RUN chmod +x ./init.sh

# CMD ["./init.sh"]
CMD ["php-fpm7.4", "-F"]

# ENTRYPOINT [ "/bin/bash", "-c", "while :; do sleep 10; done" ]