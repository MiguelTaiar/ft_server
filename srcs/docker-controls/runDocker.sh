#!/bin/bash

docker build -t ft_server .
docker run -itd -p 80:80 -p 443:443 --name ft_container ft_server
docker ps -a
