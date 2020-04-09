FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install wget vim -y

### instal nginx ###
RUN apt-get install nginx -y
RUN mkdir -p /var/www/ft_server/html
RUN rm -f /etc/nginx/sites-enabled/default
COPY srcs/index.html /var/www/ft_server/html/index.html
COPY srcs/ft_server /etc/nginx/sites-available/ft_server
RUN ln -s /etc/nginx/sites-available/ft_server /etc/nginx/sites-enabled/ft_server

### Create a self-signed certificate ###
RUN apt-get install openssl -y
COPY srcs/ssl-certificate.sh /etc/ssl/ssl-certificate.sh
RUN bash /etc/ssl/ssl-certificate.sh
RUN chmod 600 /etc/ssl/certs

### install PHP ###
RUN apt-get install php php-fpm php-mysql php-mbstring -y
RUN mkdir -p /var/www/ft_server/html/php
COPY srcs/php/index.php /var/www/ft_server/html/php/index.php

### install Mariadb ###
RUN apt-get install mariadb-server -y
RUN mkdir -p /var/www/ft_server/html/mariadb
COPY srcs/mariadb/mariadb.sh /

### PHPmyAdmin ###
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-english.tar.gz
RUN mkdir -p /var/www/ft_server/html/phpmyadmin
RUN tar -xzf phpMyAdmin-4.9.0.1-english.tar.gz --strip-components=1 -C /var/www/ft_server/html/phpmyadmin
COPY srcs/php/config.inc.php /var/www/ft_server/html/phpmyadmin/

### Worpress ###
ADD srcs/wordpress/latest.tar.gz /tmp
RUN mv /tmp/wordpress /var/www/ft_server/html/
COPY srcs/wordpress/wp-config.php /var/www/ft_server/html/wordpress/

RUN chown -R www-data:www-data /var/www/ft_server

EXPOSE 80 443

COPY srcs/start-server.sh /
ENTRYPOINT ["bash", "/start-server.sh"]
