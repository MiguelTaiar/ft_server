#!/bin/bash

FILE=/etc/nginx/sites-available/ft_server;
VALUE=`sed -n 's/autoindex *\(.*\) *;/\1/p' $FILE`;
echo "PREVIOUS VALUE:$VALUE";

if [ "$1" == "switch" ] || [ "$1" == "toggle" ] || [ "$1" == "x" ]
then
	if [ $VALUE == off ]
	then
		echo "AUTOINDEX ON";
		VALUE='on';
		sed -i "s/autoindex.*/autoindex $VALUE;/g" $FILE;
	else
		echo "AUTOINDEX OFF";
		VALUE='off';
		sed -i "s/autoindex.*/autoindex $VALUE;/g" $FILE;
	fi
elif [ "$1" == "on" ] || [ "$1" == "1" ]
then
	echo "AUTOINDEX ON";
	VALUE="on";
	sed -i "s/autoindex.*/autoindex $VALUE;/g" $FILE;
elif [ "$1" == "off" ] || [ "$1" == "0" ]
then
	echo "AUTOINDEX OFF";
	VALUE="off";
	sed -i "s/autoindex.*/autoindex $VALUE;/g" $FILE;
else
	echo "USAGE: autoindex [OPTION]
	
	switch, toggle or x
		invert the current value
	on or 1
		turn the autoindex on
	of or 0
		turn the autoindex off.";
fi
