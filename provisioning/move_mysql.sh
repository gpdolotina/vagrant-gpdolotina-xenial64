#!/bin/bash


## NOTE/WARNING
##
## ONLY EXECUTE THIS SCRIPT FOR INITIAL PROVISIONING
## AND ONLY IF YOUR LOCAL MYSQL FOLDER DO NOT ANY
## DATABASES ALREADY CREATED
##



## References:
# https://www.digitalocean.com/community/tutorials/how-to-move-a-mysql-data-directory-to-a-new-location-on-ubuntu-16-04


if [ -d "/var/mysql" ]; then
    echo -e "\n\n---------MOVING MYSQL datadir---------\n\n"

    # create new datadir
    mkdir -pv /var/mysql/

    # stop mysql
    sudo systemctl stop mysql && sudo systemctl status mysql

    # copy files from the original mysql datadir to the new datadir
    rsync -rtavzh /var/lib/mysql/ /var/mysql/

    # make sure that the copy is the same as the original
    sudo diff -r /var/mysql/ /var/lib/mysql/

    # backup the original datadir
    sudo mv /var/lib/mysql/ /var/lib/mysql.bak/

    # change the datadir target in the conf files
    sudo sh -c "sed -i 's/datadir\(.*\)/datadir \= \/var\/mysql/g' /etc/mysql/mysql.conf.d/mysqld.cnf"
    sudo sh -c "sed -i 's/datadir\(.*\)/datadir \= \/var\/mysql/g' /etc/mysql/my.cnf"

    # modify apparmor settings
    sudo systemctl stop apparmor && sudo systemctl status apparmor
    sudo sh -c "echo alias /var/lib/mysql \-\> /var/mysql, >> /etc/apparmor.d/tunables/alias"
    sudo systemctl start apparmor  && sudo systemctl status apparmor


    # start mysql server
    sudo systemctl start mysql && sudo systemctl status mysql
fi