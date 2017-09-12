#!/bin/bash


# tell debconf to use a frontend that expects no interactive input at all
export DEBIAN_FRONTEND=noninteractive


##############################
## START

echo -e "\n\n---------BOOTSTRAP provisioner---------\n\n"


####################
## COMPONENTS

echo -e "\n\n---------Installing COMPONENTS---------\n\n"

# get "add-apt-repository" command
sudo apt-get install -y software-properties-common

# install debconf-utils to allow autoconfiguration
sudo apt-get install -y debconf-utils

# install curl
sudo apt-get install -y curl

# install git
sudo apt-get install -y git git-gui vim-gtk

# install memcached
sudo apt-get install -y memcached

# install rsync
sudo apt-get install -y rsync

# install tree
sudo apt-get install -y tree

# install mcrypt
sudo apt-get install -y mcrypt

# install redis
sudo apt-get install -y redis-server

# install image software
sudo apt-get install -y imagemagick

# install python packages
sudo apt-get install -y python-software-properties build-essential gcc libpython-stdlib
sudo apt-get install -y python-mysql.connector

# update all
sudo apt-get -y update --fix-missing && sudo apt-get -y upgrade && sudo apt-get -y dist-upgrade && sudo apt-get -y autoremove


echo -e "\n\n---------Configuring server---------\n\n"

echo "Change std out profile"
sudo sh -c "sed -i 's/^mesg n\$/tty -s \&\& mesg n/g' /root/.profile"
sudo cat /root/.profile