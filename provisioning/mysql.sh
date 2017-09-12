#!/bin/bash


# tell debconf to use a frontend that expects no interactive input at all
export DEBIAN_FRONTEND=noninteractive


# global variables
DBHOST=localhost
DBUSER=root
DBPASSWD=root


##############################
## START

echo -e "\n\n---------MYSQL provisioner---------\n\n"


#######################
## MYSQL

echo -e "\n\n---------Installing MYSQL---------\n\n"

# install MySQL
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password $DBPASSWD"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $DBPASSWD"
sudo apt-get install -y -q mysql-server mysql-client libmysqlclient-dev mysql-workbench


echo -e "\n\n---------Configure MYSQL---------\n\n"

# create mysql credentials file in /home/ubuntu
read -d '' CREDENTIALS <<EOF
[clients]
user = ${DBUSER}
password = ${DBPASSWD}
host = ${DBHOST}
EOF
HOMEDIR=$([ -d "/home/vagrant" ] && echo "/home/vagrant" || echo "/home/ubuntu")
sudo echo -e "$CREDENTIALS" > ${HOMEDIR}/.my.cnf



echo -e "\n\n---------Restarting MYSQL---------\n\n"

# restart mysql server
[ -x "/etc/init.d/mysql" ] && sudo /etc/init.d/mysql restart || sudo service mysql restart

# show version
sudo mysql --version

# check db username, password and connection
sudo mysql --silent --user=$DBUSER --password=$DBPASSWD --execute="SHOW DATABASES;";

# update all
sudo apt-get -y update --fix-missing && sudo apt-get -y upgrade && sudo apt-get -y dist-upgrade && sudo apt-get -y autoremove