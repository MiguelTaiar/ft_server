FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y

#instal nginx
RUN apt-get install nginx -y

RUN mkdir -p /var/www/ft_server
RUN rm -f /etc/nginx/sites-enabled/default
COPY srcs/index.html /var/www/ft_server/index.html
COPY srcs/ft_server etc/nginx/sites-available/ft_server
RUN ln -s /etc/nginx/sites-available/ft_server /etc/nginx/sites-enabled/ft_server

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

#Install SSL

#install Mariadb

#install PHP
