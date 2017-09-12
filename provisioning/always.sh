#!/bin/bash


# tell debconf to use a frontend that expects no interactive input at all
export DEBIAN_FRONTEND=noninteractive


##############################
## START

echo -e "\n\n---------ALWAYS RUNNING provisioner---------\n\n"


# update ubuntu
#sudo apt-get -y update --fix-missing && sudo apt-get -y upgrade && sudo apt-get -y dist-upgrade && sudo apt-get -y autoremove

# update composer
COMPOSER=$(which composer)
if [ ! -z "${COMPOSER}" ]; then
    COMPOSER_DISABLE_XDEBUG_WARN=1 ${COMPOSER} self-update --quiet
fi