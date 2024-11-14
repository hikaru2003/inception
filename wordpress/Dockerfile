FROM debian:bullseye

RUN apt update
RUN apt install -y vim curl wget unzip
RUN apt install -y php-fpm php-mysql php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip

RUN wget https://wordpress.org/latest.zip
RUN unzip latest.zip
RUN mkdir -p var/www/html
RUN mv wordpress/* /var/www/html
RUN mkdir -p /run/php \
    && touch /run/php/php7.4-fpm.pid \
    && chmod 755 /run/php/php7.4-fpm.pid

ADD www.conf /etc/php/7.4/fpm/pool.d/www.conf

CMD ["php-fpm7.4", "-F"]