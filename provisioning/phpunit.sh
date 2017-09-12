#!/bin/bash


##############################
## START

echo -e "\n\n---------PHPUNIT provisioner---------\n\n"



##############################
## PHPUNIT

# check if and where phpunit is installed
PHPUNIT=$(which phpunit)
if [ ! -z "$PHPUNIT" ]; then
    echo -e "\n\n---------Uninstalling PHPUNIT---------\n\n"

    # uninstall phpunit
    sudo apt-get remove phpunit
    sudo apt-get remove --auto-remove phpunit
    sudo apt-get purge phpunit
    sudo apt-get purge --auto-remove phpunit
    sudo apt-get -y update --fix-missing && sudo apt-get -y upgrade && sudo apt-get -y dist-upgrade && sudo apt-get -y autoremove
fi

echo -e "\n\n---------Installing PHPUNIT---------\n\n"

# install/update phpunit 5.x
PHPUNIT=$([ ! -z "${PHPUNIT}" ] && echo "${PHPUNIT}" || echo "/usr/local/bin/phpunit")
sudo wget -q https://phar.phpunit.de/phpunit.phar -O ${PHPUNIT} && sudo chmod +x ${PHPUNIT}


echo -e "\n\n---------Updating PHPUNIT---------\n\n"

# self-update phpunit
${PHPUNIT} --self-update

# display version
${PHPUNIT} --version