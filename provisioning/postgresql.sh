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
## POSTGRESQL

echo -e "\n\n---------Installing POSTGRESQL---------\n\n"

# install PostgreSQL
sudo apt-get install postgresql libpq-dev