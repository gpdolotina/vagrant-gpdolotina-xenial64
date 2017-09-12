#!/bin/bash


# tell debconf to use a frontend that expects no interactive input at all
export DEBIAN_FRONTEND=noninteractive


# define global variables
SERVER_NAME='ubuntu'

# check if there are arguments
if [ "$1" != "" ]; then
    SERVER_NAME=$1
fi



##############################
## START

echo -e "\n\n---------APACHE provisioner---------\n\n"


###################
## APACHE

echo -e "\n\n---------Installing APACHE---------\n\n"

# install apache2
sudo apt-get install -y apache2

# enable apache modules
sudo a2enmod actions alias allowmethods auth_basic auth_digest cache deflate dir dump_io echo env expires file_cache filter headers include info log_debug mime mime_magic rewrite setenvif session session_cookie setenvif ssl status vhost_alias




echo -e "\n\n---------Configuring APACHE---------\n\n"

# change ServerName setting
CONF_FILE="/etc/apache2/conf-available/localhost.conf"
sudo sh -c "echo 'ServerName ${SERVER_NAME}' > ${CONF_FILE}"

# setup apache2 vhosts
if [ -d "/var/vhosts" ]; then
    # get the apache version
    APACHE_VERSION=$(sudo apache2ctl -v | grep -Po "(?<=Server version: Apache/).+?(?=\(.*\))")


    function version { echo "$@" | awk -F. '{ printf("%d%03d%03d%03d\n", $1,$2,$3,$4); }'; }
    if [ $(version $APACHE_VERSION) -ge $(version "2.4") ]; then
        sudo sh -c "echo 'IncludeOptional /var/vhosts/*.conf' >> ${CONF_FILE}"
    else
        sudo sh -c "echo 'Include /var/vhosts/*.conf' >> ${CONF_FILE}"
    fi
fi

# enable config file
sudo a2enconf localhost

# restart apache server
sudo apache2ctl configtest && sudo apache2ctl restart

# show version
sudo apache2ctl -v

# update all
sudo apt-get -y update --fix-missing && sudo apt-get -y upgrade && sudo apt-get -y dist-upgrade && sudo apt-get -y autoremove
