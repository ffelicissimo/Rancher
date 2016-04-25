#!/bin/bash
if [ ! -f /var/lib/mysql/rancherdb ]; then

	mysql_install_db

	/usr/bin/mysqld_safe &
	sleep 10s
        
        echo "CREATE DATABASE rancher COLLATE = 'utf8_general_ci' CHARACTER SET = 'utf8'; GRANT ALL PRIVILEGES ON *.* TO 'rancher'@'localhost' IDENTIFIED BY 'rancher' WITH GRANT OPTION;" | mysql
        killall mysqld
        sleep 10s
fi

/usr/bin/mysqld_safe
