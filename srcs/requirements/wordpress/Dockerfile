FROM debian:bullseye

RUN apt update -y && apt upgrade -y
RUN apt install -y vim curl wget unzip
# RUN apt install -y php-fpm php-mysql php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip

RUN apt install -y php7.4 php7.4-fpm php7.4-mysql php7.4-curl php7.4-gd php7.4-dom php7.4-exif \
	php7.4-fileinfo php7.4-igbinary php7.4-imagick php7.4-intl php7.4-mbstring php7.4-xml php7.4-zip

# RUN wget https://wordpress.org/latest.zip
# RUN unzip latest.zip
# RUN mkdir -p var/www/html
# RUN mv wordpress/* /var/www/html

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN mkdir -p /var/www/html

RUN mkdir -p /run/php \
    && touch /run/php/php7.4-fpm.pid \
    && chmod 755 /run/php/php7.4-fpm.pid

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY ./tools/wordpress_init.sh /wordpress_inits.sh
RUN chmod +x /wordpress_inits.sh

ENTRYPOINT ["/wordpress_inits.sh"]

# CMD ["php-fpm7.4", "-F"]
#ENTRYPOINT [ "/bin/bash", "-c", "while :; do sleep 10; done" ]
