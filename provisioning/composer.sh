#!/bin/bash


##############################
## START

echo -e "\n\n---------COMPOSER provisioner---------\n\n"


##############################
## COMPOSER

# check if composer is installed
sudo COMPOSER_DISABLE_XDEBUG_WARN=1 composer -v > /dev/null 2>&1
COMPOSER_IS_INSTALLED=$?

# if composer is not installed, then install
if [[ $COMPOSER_IS_INSTALLED -ne 0 ]]; then
    echo -e "\n\n---------Installing COMPOSER---------\n\n"

    # install composer
    sudo curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
fi

echo -e "\n\n---------Updating COMPOSER---------\n\n"
sudo COMPOSER_DISABLE_XDEBUG_WARN=1 composer self-update --quiet