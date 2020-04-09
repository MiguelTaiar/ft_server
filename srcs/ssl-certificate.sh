#!/bin/bash

openssl req -x509 -nodes -days 365 -subj "/C=BR/L=SP/O=42SP/"\
			-newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key\
			-out /etc/ssl/certs/nginx-selfsigned.crt
