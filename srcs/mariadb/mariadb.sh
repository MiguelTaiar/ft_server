#!/bin/bash

mysql -e "UPDATE mysql.user SET Password = PASSWORD('1234') WHERE User = 'root';"
mysql -e "DELETE FROM mysql.user WHERE User='';"
mysql -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"
mysql -e "DROP DATABASE IF EXISTS test;"
mysql -e "GRANT ALL ON phpmyadmin.* TO 'mtaiar-s'@'localhost' IDENTIFIED BY '1234';"
mysql -e "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;"
mysql -e "GRANT ALL ON wordpress.* TO 'mtaiar-s'@'localhost' IDENTIFIED BY '1234';"
mysql -e "FLUSH PRIVILEGES;"
mysql -e "SOURCE /var/www/ft_server/html/phpmyadmin/sql/create_tables.sql;"
